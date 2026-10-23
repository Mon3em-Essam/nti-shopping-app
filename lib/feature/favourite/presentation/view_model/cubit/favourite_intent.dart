part of 'favourite_cubit.dart';

sealed class FavouriteIntent {}

class GetFavouritesIntent extends FavouriteIntent {}

class AddToFavouriteIntent extends FavouriteIntent {
  AddToFavouriteIntent(this.productId);
  final int productId;
}

class RemoveFromFavouriteIntent extends FavouriteIntent {
  RemoveFromFavouriteIntent(this.productId);
  final int productId;
}
