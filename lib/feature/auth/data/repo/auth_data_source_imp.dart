import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/data/api/auth_api_interface.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_data_source_interface.dart';
import 'package:nti_shopping_app/feature/auth/data/models/login_response_dto.dart';


@Injectable(as: AuthDataSourceInterface)
class AuthDataSourceImp implements AuthDataSourceInterface {
  final AuthApiInterface _api;
  AuthDataSourceImp(this._api);

  @override
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _api.login(email: email, password: password);
    switch (result) {
      case Success<LoginResponseDto>():
        return Success(result.data.toEntity());
      case Error<LoginResponseDto>():
        return Error(result.messageError);
    }
  }
}
