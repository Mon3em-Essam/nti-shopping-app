import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/data/api/auth_api_interface.dart';
import 'package:nti_shopping_app/feature/auth/data/models/register_response_dto.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';
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

  @override
Future<ResultApi<RegisterResponseEntity>> register({
  required String name,
  required String phone,
  required String email,
  required String password,
  required String confirmPassword,
}) async {
  final result = await _api.register(
    name: name,
    phone: phone,
    email: email,
    password: password,
    confirmPassword: confirmPassword,
  );

  switch (result) {
    case Success<RegisterResponseDto>():
      return Success(result.data.toEntity());
    case Error<RegisterResponseDto>():
      return Error(result.messageError);
  }
}
}
