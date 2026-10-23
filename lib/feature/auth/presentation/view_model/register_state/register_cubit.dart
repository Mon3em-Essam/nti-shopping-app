import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/use_case/register_use_case.dart';

part 'register_state.dart';
part 'register_intent.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._useCase) : super(RegisterInitial());

  final RegisterUseCase _useCase;

  void intent(RegisterIntent intent) {
    switch (intent) {
      case SignUpIntent():
        _register(intent);
    }
  }

  Future<void> _register(SignUpIntent i) async {
    emit(RegisterLoading());

    final result = await _useCase.invoke(
      name: i.name,
      phone: i.phone,
      email: i.email,
      password: i.password,
      confirmPassword: i.confirmPassword,
    );

    switch (result) {
      case Success<RegisterResponseEntity>():
        emit(RegisterSuccess(result.data.message));

      case Error<RegisterResponseEntity>():
        emit(RegisterError(result.messageError));
    }
  }
}