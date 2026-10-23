import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';

abstract interface class FavouriteRepoInterface {
  Future<ResultApi<List<FavouriteEntity>>> getFavourites();
  Future<ResultApi<bool>> addToFavourite(int productId);
  Future<ResultApi<bool>> removeFromFavourite(int productId);
}
