import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';

abstract class AuthDataSourceInterface {
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  });

  Future<ResultApi<RegisterResponseEntity>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
