import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/search/data/api/search_api_interface.dart';
import 'package:nti_shopping_app/feature/search/data/model/search_response_dto.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';
import 'package:nti_shopping_app/feature/search/domain/repo/search_data_source_interface.dart';

@Injectable(as: SearchDataSourceInterface)
class SearchDataSourceImp implements SearchDataSourceInterface {
  final SearchApiInterface _api;

  SearchDataSourceImp(this._api);

  @override
  Future<ResultApi<List<SearchProductEntity>>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  }) async {
    final result = await _api.searchProducts(
      query: query,
      skip: skip,
      limit: limit,
    );

    switch (result) {
      case Success<SearchResponseDto>():
        final entities = result.data.list
            ?.map((dto) => dto.toEntity())
            .toList() ??[];
        return Success(entities);
      case Error<SearchResponseDto>():
        return Error(
          result.messageError,
        );
    }
  }
}
