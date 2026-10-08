import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';

import 'feature/Onboarding/presentation/view/screens/onboarding_screen.dart';

void main() async {
  // السطر ده ضروري جداً قبل استخدام SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();

  // قراءة حالة المستخدم لمعرفة إذا كانت هذه أول مرة يفتح فيها التطبيق
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
          initialRoute: isFirstTime ? AppRoutes.onBoarding : AppRoutes.login,
          home: isFirstTime ? const OnboardingScreen() : null,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
