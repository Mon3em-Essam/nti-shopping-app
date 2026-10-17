import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_repo_interface.dart';

@injectable
class CartGetUseCase {
  CartGetUseCase(this._repo);
  final CartRepoInterface _repo;
  Future<ResultApi<List<CartEntity>>> invoke() async => await _repo.getCart();
}
