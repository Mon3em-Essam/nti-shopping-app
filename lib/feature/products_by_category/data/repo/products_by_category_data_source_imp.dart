import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/api/products_by_category_api_interface.dart';
import 'package:nti_shopping_app/feature/products_by_category/data/models/products_by_category_dto.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_data_source_interface.dart';

@Injectable(as: ProductsByCategoryDataSourceInterface)
class ProductsByCategoryDataSourceImp
    implements ProductsByCategoryDataSourceInterface {
  ProductsByCategoryDataSourceImp({required this.api});

  final ProductsByCategoryApiInterface api;
  @override
  Future<ResultApi<ProductsByCategoryListDto>> getProductsByCategory(
    String category,
    int skip,
    int limit,
  ) async => await api.getProductsByCategory(category, skip, limit);
}
