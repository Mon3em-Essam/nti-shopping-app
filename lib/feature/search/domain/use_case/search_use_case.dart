import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';
import 'package:nti_shopping_app/feature/search/domain/repo/search_repo_interface.dart';

@injectable
class SearchUseCase {
  final SearchRepoInterface _repoInterface;
  SearchUseCase(this._repoInterface);
  Future<ResultApi<List<SearchProductEntity>>> invoke({
    required String query,
    int skip = 0,
    int limit = 10,
  }) => _repoInterface.searchProducts(query: query, skip: skip, limit: limit);
}
