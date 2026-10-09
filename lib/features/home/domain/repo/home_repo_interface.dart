import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/domain/entities/product_response_entity.dart';
import '../entities/category_entity.dart';

abstract interface class HomeRepoInterface {
  //Future<ResultApi<CategoryEntity>> getAllCategories();
  Future<ResultApi<ProductResponseEntity>> getAllProducts();
}
