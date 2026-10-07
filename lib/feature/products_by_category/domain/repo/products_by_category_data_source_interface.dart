import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';

abstract interface class ProductsByCategoryDataSourceInterface {
  Future<ProductsByCategoryListDto> getProductsByCategory(
    String category,
    int skip,
    int limit,
  );
}
