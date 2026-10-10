import 'package:shared_preferences/shared_preferences.dart';
import 'package:nti_shopping_app/core/routes/app_routes.dart';

Future<String> initialRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime =
      prefs.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    return AppRoutes.onBoarding;
  }
  return AppRoutes.login;

  /// final startupHelper = serviceLocator<StartupHelper>();

  /// if (startupHelper.token.isNotEmpty) {
  ///   return AppRoutes.appSection;
  /// } else {
  ///   return AppRoutes.login;
  /// }
}
