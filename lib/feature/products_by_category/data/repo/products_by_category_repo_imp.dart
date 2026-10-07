import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/product_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_data_source_interface.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_repo_interface.dart';

@Injectable(as: ProductsByCategoryRepoInterface)
class ProductsByCategoryRepoImp implements ProductsByCategoryRepoInterface {
  ProductsByCategoryRepoImp({required this.dataSource});

  final ProductsByCategoryDataSourceInterface dataSource;

  @override
  Future<List<ProductByCategoryEntity>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  ) async {
    ProductsByCategoryListDto dtoList = await dataSource.getProductsByCategory(
      category,
      skip,
      limit,
    );
    return (dtoList.list ?? []).map((e) => e.toEntity()).toList();
  }
}
