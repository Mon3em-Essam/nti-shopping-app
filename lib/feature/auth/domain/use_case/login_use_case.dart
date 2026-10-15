import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_repo_interface.dart';

@injectable
class LoginUseCase {
  final AuthRepoInterface _repo;
  LoginUseCase(this._repo);

  Future<ResultApi<LoginResponseEntity>> invoke({
    required String email,
    required String password,
  }) => _repo.login(email: email, password: password);
}
