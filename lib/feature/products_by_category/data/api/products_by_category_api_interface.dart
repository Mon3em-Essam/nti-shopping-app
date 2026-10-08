import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';

abstract interface class ProductsByCategoryApiInterface {
  Future<ResultApi<ProductsByCategoryListDto>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  );
}
