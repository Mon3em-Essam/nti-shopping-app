import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';

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
    // onBoarding: (context) => OnboardingScreen(),
    // login: (context) => BlocProvider(
    //   create: (context) => serviceLocator<LoginCubit>(),
    //   child: LogIn(),
    // ),
    // hello: (context) => HelloScreen(),
    // register: (context) => BlocProvider<RegisterCubit>(
    //   create: (context) => serviceLocator<RegisterCubit>(),
    //   child: Register(),
    // ),
    // appSection: (context) => AppSectionView(),
    // search: (context) => SearchScreen(),
  };
}
