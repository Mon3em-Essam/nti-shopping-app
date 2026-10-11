import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/api/products_by_category_api_interface.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';
import 'package:http/http.dart' as http;

@Injectable(as: ProductsByCategoryApiInterface)
class ProductsByCategoryApiImp implements ProductsByCategoryApiInterface {
  @override
  Future<ResultApi<ProductsByCategoryListDto>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  ) async {
    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.productByCategoryEndPoint}/smartphones?skip=$skip&limit=$limit',
      );
      final response = await http.get(
        uri,
        headers: {'Authorization': 'Bearer ${AppConstants.token}'},
      );
      final json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(ProductsByCategoryListDto.fromJson(json));
      }

      return Error('Error: ${response.statusCode} ${json["message"]}');
    } on SocketException {
      return Error(AppConstants.socketErrormsg);
    } catch (e) {
      return Error('Error: ${e.toString()}');
    }
  }
}
