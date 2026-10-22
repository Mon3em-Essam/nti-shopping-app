import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/data/model/favourite_dto.dart';

abstract interface class FavouriteDataSourceInterface {
  Future<ResultApi<FavouriteDto>> getFavourites();
  Future<ResultApi<dynamic>> addToFavourite(int productId);
  Future<ResultApi<dynamic>> removeFromFavourite(int productId);
}
