import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/data/model/cart_dto.dart';

abstract interface class CartApiInterface {
  Future<ResultApi<List<CartDto>>> getCart();
  Future<ResultApi<String>> deleteFromCart(String productId);
  Future<ResultApi<String>> addToCart(String productId);
}
