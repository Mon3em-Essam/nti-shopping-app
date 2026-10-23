import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/auth/data/api/auth_api_interface.dart';
import 'package:nti_shopping_app/feature/auth/data/models/login_response_dto.dart';
import 'package:nti_shopping_app/feature/auth/data/models/register_response_dto.dart';

@Injectable(as: AuthApiInterface)
class AuthApiImp implements AuthApiInterface {
  @override
  Future<ResultApi<LoginResponseDto>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Uri url = Uri.parse('${ApiConstants.baseUrl}/auth/signIn');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(LoginResponseDto.fromJson(json));
      } else {
        return Error(json['message'] ?? "Invalid email or password");
      }
    } catch (e) {
      return Error(e.toString());
    }
  }

  @override
  Future<ResultApi<RegisterResponseDto>> register({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final Uri url = Uri.parse('${ApiConstants.baseUrl}/auth/signUp');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
        }),
      );

      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(RegisterResponseDto.fromJson(json));
      } else {
        return Error(json['message'] ?? "Registration failed");
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}