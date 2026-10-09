import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/category_item_entity.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/product_response_entity.dart';

abstract interface class HomeRepoInterface {
  Future<ResultApi<List<CategoryItemEntity>>> getAllCategories();
  Future<ResultApi<ProductResponseEntity>> getAllProducts();
}
