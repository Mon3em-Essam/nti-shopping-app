part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteInitialLoading extends FavouriteState {}

final class FavouriteSuccess extends FavouriteState {
  FavouriteSuccess(this.data);
  final List<FavouriteEntity> data;
}

final class FavouriteError extends FavouriteState {
  FavouriteError(this.error);
  final String error;
}

final class FavouriteLoading extends FavouriteState {
  FavouriteLoading(this.data);
  final List<FavouriteEntity> data;
}
