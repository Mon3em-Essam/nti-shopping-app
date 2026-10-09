import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/domain/entities/product_response_entity.dart';

abstract class HomeDataSourceInterface {
  Future<ResultApi<ProductResponseEntity>> getAllProducts();
}
