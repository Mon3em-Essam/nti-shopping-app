import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/constants/app_keys.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/core/storage_helper/app_secure_storage.dart';
import 'package:nti_shopping_app/features/home/data/api/home_api_interface.dart';
import 'package:nti_shopping_app/features/home/data/model/product_response_dto.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HomeApiInterface)
class HomeApiImp implements HomeApiInterface {
  final AppSecureStorage _secureStorage;
  HomeApiImp(this._secureStorage);
  @override
  Future<ResultApi<ProductResponseDto>> getProduct() async {
    try {
      final Uri url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllProduct}');
      String token = await _secureStorage.read(AppKeys.token);

      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(ProductResponseDto.fromJson(json));
      } else {
        return Error("ops from server try again...");
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
