import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/data/model/product_response_dto.dart';

abstract interface class HomeApiInterface {
  Future<ResultApi<ProductResponseDto>> getProduct();
  
}
