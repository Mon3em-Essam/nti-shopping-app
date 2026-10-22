import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_repo_interface.dart';

@injectable
class RemoveFavouriteUseCase {
  RemoveFavouriteUseCase(this.repo);

  final FavouriteRepoInterface repo;

  Future<ResultApi<bool>> invoke(int productId) async {
    return await repo.removeFromFavourite(productId);
  }
}
