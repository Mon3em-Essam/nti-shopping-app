import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/data/model/favourite_dto.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_data_source_interface.dart';
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_repo_interface.dart';

@Injectable(as: FavouriteRepoInterface)
class FavouriteRepoImp implements FavouriteRepoInterface {
  FavouriteRepoImp({required this.dataSource});

  final FavouriteDataSourceInterface dataSource;

  @override
  Future<ResultApi<List<FavouriteEntity>>> getFavourites() async {
    final res = await dataSource.getFavourites();
    switch (res) {
      case Success<FavouriteDto>():
        final favouriteDto = res.data;
        final favouriteList = (favouriteDto.list ?? [])
            .map((e) => e.toEntity())
            .toList();

        return Success(favouriteList);

      case Error<FavouriteDto>():
        return Error(res.messageError);
    }
  }

  @override
  Future<ResultApi<bool>> addToFavourite(int productId) async {
    final res = await dataSource.addToFavourite(productId);
    switch (res) {
      case Success<dynamic>():
        return Success(true);

      case Error<dynamic>():
        return Error(res.messageError);
    }
  }

  @override
  Future<ResultApi<bool>> removeFromFavourite(int productId) async {
    final res = await dataSource.removeFromFavourite(productId);
    switch (res) {
      case Success<dynamic>():
        return Success(true);

      case Error<dynamic>():
        return Error(res.messageError);
    }
  }
}
