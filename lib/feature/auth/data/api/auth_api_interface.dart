import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/data/models/login_response_dto.dart';

abstract interface class AuthApiInterface {
  Future<ResultApi<LoginResponseDto>> login({
    required String email,
    required String password,
  });
}
