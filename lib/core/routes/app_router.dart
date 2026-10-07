import 'package:flutter/material.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/sign_up.dart';
import 'app_routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const Login());

      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const SignUp());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
