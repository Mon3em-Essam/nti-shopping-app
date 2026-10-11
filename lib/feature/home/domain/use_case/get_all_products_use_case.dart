import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/product_response_entity.dart';
import 'package:nti_shopping_app/feature/home/domain/repo/home_repo_interface.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepoInterface _repo;
  GetAllProductsUseCase(this._repo);

  Future<ResultApi<ProductResponseEntity>> invoke() => _repo.getAllProducts();
}
