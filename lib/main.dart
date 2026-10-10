import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/theme/app_theme.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/hello_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';

import 'feature/Onboarding/presentation/view/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  configureDependencies();

  runApp(MyApp(isFirstTime: isFirstTime));
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;

  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: isFirstTime ? AppRoutes.onBoarding : AppRoutes.login,
          home: isFirstTime ? OnboardingScreen() : Login(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
