import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> initialRoute() async {
  final startupHelper = serviceLocator<StartupHelper>();

  if (startupHelper.token.isNotEmpty) {
    return AppRoutes.appSection;
  }

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    return AppRoutes.onBoarding;
  }
  return AppRoutes.hello;
}
