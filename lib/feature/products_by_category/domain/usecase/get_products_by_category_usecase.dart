import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/product_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_repo_interface.dart';

@injectable
class GetProductsByCategoryUsecase {
  GetProductsByCategoryUsecase({required this.categoryProductsRepo});
  final ProductsByCategoryRepoInterface categoryProductsRepo;

  Future<List<ProductByCategoryEntity>> invoke(
    String category,
    int skip,
    int limit,
  ) async =>
      await categoryProductsRepo.getProductsByCategory(category, skip, limit);
}
