import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_repo_interface.dart';

@injectable
class GetFavouriteUseCase {
  GetFavouriteUseCase({required this.favouriteRepo});
  final FavouriteRepoInterface favouriteRepo;

  Future<ResultApi<List<FavouriteEntity>>> invoke() async =>
      await favouriteRepo.getFavourites();
}
