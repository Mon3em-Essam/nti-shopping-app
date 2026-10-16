import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_data_source_interface.dart';
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_repo_interface.dart';

@Injectable(as: CartRepoInterface)
class CartRepoImp implements CartRepoInterface {
  CartRepoImp(this._dataSource);
  final CartDataSourceInterface _dataSource;
  @override
  Future<ResultApi<String>> addToCart(String productId) async =>
      await _dataSource.addToCart(productId);

  @override
  Future<ResultApi<String>> deleteFromCart(String productId) async =>
      await _dataSource.deleteFromCart(productId);

  @override
  Future<ResultApi<List<CartEntity>>> getCart() async =>
      await _dataSource.getCart();
}
