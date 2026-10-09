import 'package:flutter/material.dart';
import 'package:nti_shopping_app/feature/Onboarding/presentation/view/screens/onboarding_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/hello_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/sign_up_screen.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/screens/home_screen.dart';

abstract class AppRoutes {
  static const String login = '/login';
  static const String onBoarding = '/onboarding';
  static const String hello = '/hello';
  static const String register = '/register';
  static const String appSection = '/appSection';
  static const String home = '/home';
  static const String updateAcc = '/updateAcc';
  static const String search = '/search';

  static Map<String, WidgetBuilder> routes = {
    onBoarding: (context) => OnboardingScreen(),
    // login: (context) => BlocProvider(
    //   create: (context) => serviceLocator<LoginCubit>(),
    //   child: Login(),
    // ),
    login: (context) => Login(),
    register: (context) => SignUp(),
    hello: (context) => HelloScreen(),
    home: (context) => HomeScreen(),
    // register: (context) => BlocProvider<RegisterCubit>(
    //   create: (context) => serviceLocator<RegisterCubit>(),
    //   child: Register(),
    // ),
    // appSection: (context) => AppSectionView(),
    // search: (context) => SearchScreen(),
  };
}
