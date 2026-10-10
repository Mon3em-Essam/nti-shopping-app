import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/routes/intial_route.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_shopping_app/core/theme/app_theme.dart';
import 'core/routes/app_routes.dart';


  
  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  final startup = serviceLocator<StartupHelper>();
  await startup.startupAppInit();

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