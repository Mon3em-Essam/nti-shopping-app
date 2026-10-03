import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/data/model/category_dto.dart';

abstract class HomeDataSourceInterface {
  Future<ResultApi<CategoryResponseDto>> getCategories();
}
