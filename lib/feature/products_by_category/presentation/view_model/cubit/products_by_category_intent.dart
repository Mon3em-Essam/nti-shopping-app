part of 'products_by_category_cubit.dart';

sealed class ProductsByCategoryIntent {}

class GetProductsByCategoryIntent extends ProductsByCategoryIntent {
  GetProductsByCategoryIntent(this.category);
  final String category;
}
