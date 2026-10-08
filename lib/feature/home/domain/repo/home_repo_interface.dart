import 'package:nti_shopping_app/core/network/result_api.dart';
import '../entities/category_entity.dart';

abstract class HomeRepoInterface {
  Future<ResultApi<List<CategoryEntity>>> getCategories();
}
