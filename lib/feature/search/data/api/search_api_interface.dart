import 'package:nti_shopping_app/core/network/result_api.dart';
import '../model/search_response_dto.dart';

abstract interface class SearchApiInterface {
  Future<ResultApi<SearchResponseDto>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  });
}
