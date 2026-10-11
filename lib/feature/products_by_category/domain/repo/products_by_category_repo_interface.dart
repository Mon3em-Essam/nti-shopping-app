import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/products_by_category_entity.dart';

abstract interface class ProductsByCategoryRepoInterface {
  Future<ResultApi<List<ProductsByCategoryEntity>>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  );
}
