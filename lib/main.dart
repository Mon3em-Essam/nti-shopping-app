import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_shopping_app/core/theme/app_theme.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/hello_screen.dart';
import 'package:nti_shopping_app/feature/auth/presentation/screens/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/routes/app_routes.dart';

import 'feature/Onboarding/presentation/view/screens/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

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
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: isFirstTime ? AppRoutes.onBoarding : AppRoutes.hello,
          home: isFirstTime ? OnboardingScreen() : HelloScreen(),
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
