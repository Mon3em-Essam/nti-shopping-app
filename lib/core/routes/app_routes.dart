import 'package:flutter/material.dart';
import 'package:nti_shopping_app/feature/Onboarding/presentation/view/screens/onboarding_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/hello_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/sign_up_screen.dart';
import 'package:nti_shopping_app/feature/app_section/presentation/view/app_section_view.dart';
import 'package:nti_shopping_app/feature/product_details/domain/entities/product_entity.dart';
import 'package:nti_shopping_app/feature/product_details/presentation/view/screens/product_details_screen.dart';
import 'package:nti_shopping_app/feature/products_by_category/presentation/view/screens/products_by_category_screen.dart';
import 'package:nti_shopping_app/feature/search/presentation/view/search_screen.dart';

abstract class AppRoutes {
  static const String login = '/login';
  static const String onBoarding = '/onboarding';
  static const String hello = '/hello';
  static const String register = '/register';
  static const String appSection = '/appSection';
  static const String home = '/home';
  static const String details = '/details';
  static const String updateAcc = '/updateAcc';
  static const String search = '/search';
  static const String productsByCategory = '/productsByCategory';

  static Map<String, WidgetBuilder> routes = {
    onBoarding: (context) => OnboardingScreen(),
    login: (context) => Login(),
    register: (context) => SignUp(),
    hello: (context) => HelloScreen(),
    home: (context) => const AppSectionView(),
    details: (context) {
      final product =
          ModalRoute.of(context)!.settings.arguments as ProductEntity;
      return ProductDetails(product: product);
    },
   
    appSection: (context) => AppSectionView(),
    search: (context) => const SearchScreen(),
    productsByCategory: (context) => ProductsByCategoryScreen(),
  };
}
