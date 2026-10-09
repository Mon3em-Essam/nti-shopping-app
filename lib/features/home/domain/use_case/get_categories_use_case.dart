import 'package:nti_shopping_app/features/home/domain/repo/home_repo_interface.dart';

class GetCategoriesUseCase {
  final HomeRepoInterface homeRepo;

  GetCategoriesUseCase({required this.homeRepo});

  // Future<ResultApi<List<CategoryEntity>>> call() async {
  //   final result = await homeRepo.getAllCategories();
  //   //return result;
  // }
}
