import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';
import 'package:nti_shopping_app/feature/search/domain/repo/search_data_source_interface.dart';
import 'package:nti_shopping_app/feature/search/domain/repo/search_repo_interface.dart';

@Injectable(as: SearchRepoInterface)
class SearchRepoImp implements SearchRepoInterface {
  final SearchDataSourceInterface _dataSource;

  SearchRepoImp(this._dataSource);

  @override
  Future<ResultApi<List<SearchProductEntity>>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  }) async =>
      await _dataSource.searchProducts(query: query, skip: skip, limit: limit);
}
