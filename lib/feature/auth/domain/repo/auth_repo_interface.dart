import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';

abstract interface class AuthRepoInterface {
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
