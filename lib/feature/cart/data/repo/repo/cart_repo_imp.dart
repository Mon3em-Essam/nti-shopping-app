import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/data/model/cart_dto.dart';
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
  Future<ResultApi<List<CartEntity>>> getCart() async {
    final res = await _dataSource.getCart();
    switch (res) {
      case Success<List<CartDto>>():
        final data = res.data;
        final cartEntityList = data.map((e) => e.toEntity()).toList();
        return Success(cartEntityList);
      case Error<List<CartDto>>():
        return Error(res.messageError);
    }
  }
}
