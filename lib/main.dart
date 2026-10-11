import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/routes/intial_route.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_shopping_app/core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();

  final startup = serviceLocator<StartupHelper>();
  await startup.startupAppInit();

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  final String initRoute = await initialRoute();
  runApp(MyApp(initRoute: initRoute));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initRoute});
  final String initRoute;

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
          initialRoute: initRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
