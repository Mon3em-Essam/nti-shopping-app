part of 'home_cubit.dart';


@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HProductsLoading extends HomeState {}

class HProductsSuccess extends HomeState {
  final List<ProductItemEntity> productItemEntity;
  HProductsSuccess(this.productItemEntity);
}

class HProductsError extends HomeState {
  final String error;
  HProductsError(this.error);
}

class HICategoriesLoading extends HomeState {}

class HICategoriesSuccess extends HomeState {
  final List<CategoryItemEntity> categoryItemEntity;
  HICategoriesSuccess(this.categoryItemEntity);
}

class HICategoriesError extends HomeState {
  final String error;
  HICategoriesError(this.error);
}
