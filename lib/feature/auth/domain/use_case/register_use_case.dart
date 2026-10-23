import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_repo_interface.dart';

@injectable
class RegisterUseCase {
  final AuthRepoInterface _repo;
  RegisterUseCase(this._repo);

  Future<ResultApi<RegisterResponseEntity>> invoke({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) => _repo.register(
        name: name,
        phone: phone,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
}