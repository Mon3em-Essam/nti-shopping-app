import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/data/api/cart_api_interface.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_data_source_interface.dart';

@Injectable(as: CartDataSourceInterface)
class CartDataSourceImp implements CartDataSourceInterface {
  CartDataSourceImp(this._api);
  final CartApiInterface _api;
  @override
  Future<ResultApi<String>> addToCart(String productId) async =>
      await _api.addToCart(productId);

  @override
  Future<ResultApi<String>> deleteFromCart(String productId) async =>
      await _api.deleteFromCart(productId);

  @override
  Future<ResultApi<List<CartEntity>>> getCart() async => await _api.getCart();
}
