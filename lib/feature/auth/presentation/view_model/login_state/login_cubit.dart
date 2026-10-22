import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/use_case/login_use_case.dart';

part 'login_state.dart';
part 'login_intent.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._useCase, this._startupHelper) : super(LoginInitial());

  final LoginUseCase _useCase;
  final StartupHelper _startupHelper;

  void intent(LoginIntent intent) {
    switch (intent) {
      case SignInIntent():
        _login(email: intent.email, password: intent.password);
    }
  }

  Future<void> _login({required String email, required String password}) async {
    emit(LoginLoading());

    final result = await _useCase.invoke(email: email, password: password);

    switch (result) {
      case Success<LoginResponseEntity>():
        await _startupHelper.saveToken(result.data.token);
        emit(LoginSuccess());

      case Error<LoginResponseEntity>():
        emit(LoginError(result.messageError));
    }
  }
}
