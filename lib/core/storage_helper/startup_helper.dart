import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/app_keys.dart';
import 'package:nti_shopping_app/core/storage_helper/app_secure_storage.dart';

@lazySingleton
class StartupHelper {
  final AppSecureStorage _secureStorage;

  StartupHelper(this._secureStorage);

  String? _token;

  String get token => _token ?? "";


  Future<void> startupAppInit() async {
    await _getToken();
  }
  
  ///We will change the token after we add the data for the auth.
  Future<void> _getToken() async {
    _token = await _secureStorage.read(AppKeys.token);
  }

  /// when token is not static

  /// String initialRoute() {

  ///   if (_token != null) {
  ///     return AppRoutes.appSection;
  ///   } else {
  ///     return AppRoutes.register;
  ///   }
  /// }
}
