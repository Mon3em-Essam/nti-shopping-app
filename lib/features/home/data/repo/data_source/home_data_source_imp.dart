import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/data/model/category_dto.dart';
import 'package:nti_shopping_app/features/home/domain/repo/home_data_source_interface.dart';


class HomeDataSourceImp implements HomeDataSourceInterface {
  @override
  Future<ResultApi<CategoryResponseDto>> getCategories() async {
    try {
      Uri url = Uri.https(
        "supermarket-dan1.onrender.com",
        "/api/v1/home/categories",
      );

      var response = await http.get(
        url,
        headers: {
          'Authorization':
              'Bearer YOUR_TOKEN_HERE', 
        },
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        String responseString = response.body;
        var json = jsonDecode(responseString);

        return Success(CategoryResponseDto.fromJson(json));
      } else {
        return Error("Error From Server: ${response.statusCode}");
      }
    } on SocketException {
      return Error("Error From internet. try again...");
    } catch (e) {
      return Error('Error $e');
    }
  }
}
