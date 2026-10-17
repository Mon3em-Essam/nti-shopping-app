import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';

abstract interface class CartApiInterface {
  Future<ResultApi<List<CartEntity>>> getCart();
  Future<ResultApi<String>> deleteFromCart(String productId);
  Future<ResultApi<String>> addToCart(String productId);
}
