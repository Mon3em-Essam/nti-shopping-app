import 'package:nti_shopping_app/feature/auth/domain/entities/login_response_entity.dart';

class LoginResponseDto {
  final String? message;
  final String? token;

  LoginResponseDto({this.message, this.token});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(message: json['message'], token: json['token']);
  }

  LoginResponseEntity toEntity() {
    return LoginResponseEntity(message: message ?? '', token: token ?? '');
  }
}
