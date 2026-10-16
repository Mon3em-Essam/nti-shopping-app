import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/constants/api_constants.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart';
import 'package:nti_shopping_app/feature/search/data/api/search_api_interface.dart';
import 'package:nti_shopping_app/feature/search/data/model/search_response_dto.dart';

@Injectable(as: SearchApiInterface)
class SearchApiImp implements SearchApiInterface {
  final StartupHelper _helper;

  SearchApiImp(this._helper);

  @override
  Future<ResultApi<SearchResponseDto>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  }) async {
    try {
      final Uri url = Uri.parse('${ApiConstants.baseUrl}/home/productsFilter');

      var response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer ${_helper.token}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"search": query, "skip": skip, "limit": limit}),
      );

      var json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Success(SearchResponseDto.fromJson(json));
      } else {
        return Error("ops from server try again...");
      }
    } catch (e) {
      return Error(e.toString());
    }
  }
}
