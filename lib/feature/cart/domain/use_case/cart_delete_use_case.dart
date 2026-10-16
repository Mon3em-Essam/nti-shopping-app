import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_repo_interface.dart';

@injectable
class CartDeleteUseCase {
  CartDeleteUseCase(this._repo);
  final CartRepoInterface _repo;
  Future<ResultApi<String>> invoke(String productId) async =>
      await _repo.deleteFromCart(productId);
}
