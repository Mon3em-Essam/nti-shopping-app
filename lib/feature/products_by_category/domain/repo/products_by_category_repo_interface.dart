import 'package:nti_shopping_app/feature/products_by_category/domain/entities/product_by_category_entity.dart';

abstract interface class ProductsByCategoryRepoInterface {
  Future<List<ProductByCategoryEntity>>getProductsByCategory(
    String category,
    int skip,
    int limit,
  );
}
