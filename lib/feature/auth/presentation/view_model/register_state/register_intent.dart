part of 'register_cubit.dart';

@immutable
sealed class RegisterIntent {}

class SignUpIntent extends RegisterIntent {
  final String name, phone, email, password, confirmPassword;
  SignUpIntent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}