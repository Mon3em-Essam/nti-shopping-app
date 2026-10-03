import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/data/model/category_dto.dart';
import 'package:nti_shopping_app/features/home/domain/entities/category_entity.dart';
import 'package:nti_shopping_app/features/home/domain/repo/home_data_source_interface.dart';
import 'package:nti_shopping_app/features/home/domain/repo/home_repo_interface.dart';

class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface dataSource;

  HomeRepoImp({required this.dataSource});

  @override
  Future<ResultApi<List<CategoryEntity>>> getCategories() async {
    final result = await dataSource.getCategories();

    if (result is Success<CategoryResponseDto>) {
      var responseDto = result.data;

      List<CategoryEntity> categories =
          responseDto.list?.map((item) {
            return CategoryEntity(
              name: item.name ?? '', 
              image: item.image ?? '',  
            );
          }).toList() ??
          [];

      return Success(categories);
    } else {
      return Error((result as Error).messageError);
    }
  }
}
