import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';

abstract interface class SearchRepoInterface {
  Future<ResultApi<List<SearchProductEntity>>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  });
}
