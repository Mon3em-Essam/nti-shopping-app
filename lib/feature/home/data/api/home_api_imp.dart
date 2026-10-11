import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:nti_shopping_app/feature/home/data/api/home_api_interface.dart';
import 'package:nti_shopping_app/feature/home/data/model/category_item_dto.dart';
import 'package:nti_shopping_app/feature/home/data/model/product_response_dto.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HomeApiInterface)
class HomeApiImp implements HomeApiInterface {
  final StartupHelper _helper;

  HomeApiImp(this._helper);
  @override
  Future<ResultApi<ProductResponseDto>> getProduct() async {
    try {
      final Uri url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.getAllProduct}',
      );

      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${_helper.token}",
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

  @override
  Future<ResultApi<List<CategoryItemDto>>> getAllCategories() async {
    try {
      final Uri url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.getAllCategories}',
      );
      var response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer ${_helper.token}",
          "Content-Type": "application/json",
        },
      );
      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (json["list"] != null) {
          List jsonList = json["list"];
          var listOfCategory = jsonList
              .map((e) => CategoryItemDto.fromJson(e))
              .toList();

          return Success(listOfCategory);
        } else {
          return Error("Error from json...");
        }
      } else {
        return Error("ops from server try again...");
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
