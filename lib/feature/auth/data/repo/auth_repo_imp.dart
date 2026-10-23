import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_data_source_interface.dart';
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_repo_interface.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepoImp implements AuthRepoInterface {
  final AuthDataSourceInterface _dataSource;
  AuthRepoImp(this._dataSource);

  @override
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  }) async => await _dataSource.login(email: email, password: password);

  @override
  Future<ResultApi<RegisterResponseEntity>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async => await _dataSource.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
}