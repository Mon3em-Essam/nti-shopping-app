part of 'login_cubit.dart';

sealed class LoginIntent {}

class SignInIntent extends LoginIntent {
  SignInIntent({required this.email, required this.password});

  final String email;
  final String password;
}
