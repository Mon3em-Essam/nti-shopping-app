import 'package:nti_shopping_app/feature/auth/domain/entities/register_response_entity.dart';

class RegisterResponseDto {
  final String? message;
  RegisterResponseDto({this.message});

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      RegisterResponseDto(message: json['message']);

  RegisterResponseEntity toEntity() =>
      RegisterResponseEntity(message: message ?? '');
}