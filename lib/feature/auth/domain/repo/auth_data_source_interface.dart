import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';

abstract class AuthDataSourceInterface {
  Future<ResultApi<LoginResponseEntity>> login({
    required String email,
    required String password,
  });
}
