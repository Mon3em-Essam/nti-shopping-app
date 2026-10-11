part of 'products_by_category_cubit.dart';

@immutable
sealed class ProductsByCategoryState {
}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}

final class ProductsByCategoryInitialLoading extends ProductsByCategoryState {}

final class ProductsByCategorySuccess extends ProductsByCategoryState {
  ProductsByCategorySuccess(this.data);
  final List<ProductsByCategoryEntity> data;
}

final class ProductsByCategoryError extends ProductsByCategoryState {
  ProductsByCategoryError(this.error);
  final String error;
}

final class ProductsByCategoryLoading extends ProductsByCategoryState {
  ProductsByCategoryLoading(this.data);
  final List<ProductsByCategoryEntity> data;
}
