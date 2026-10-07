import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/product_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_data_source_interface.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_repo_interface.dart';

@Injectable(as: ProductsByCategoryRepoInterface)
class ProductsByCategoryRepoImp implements ProductsByCategoryRepoInterface {
  ProductsByCategoryRepoImp({required this.dataSource});

  final ProductsByCategoryDataSourceInterface dataSource;

  @override
  Future<ResultApi<List<ProductByCategoryEntity>>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  ) async {
    final res = await dataSource.getProductsByCategory(category, skip, limit);
    switch (res) {
      case Success<ProductsByCategoryListDto>():
        final productsByCategoryListDto = res.data;
        final productByCategoryEntityList =
            (productsByCategoryListDto.list ?? [])
                .map((e) => e.toEntity())
                .toList();

        return Success(productByCategoryEntityList);

      case Error<ProductsByCategoryListDto>():
        return Error(res.messageError);
    }
  }
}
