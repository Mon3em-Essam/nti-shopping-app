import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/category_entity.dart';
import 'package:nti_shopping_app/feature/home/domain/repo/home_repo_interface.dart';

class GetCategoriesUseCase {
  final HomeRepoInterface homeRepo;

  GetCategoriesUseCase({required this.homeRepo});

  Future<ResultApi<List<CategoryEntity>>> call() async {
    final result = await homeRepo.getCategories();
    return result;
  }
}
