part of 'products_by_category_cubit.dart';

sealed class ProductsByCategoryIntent {}

class GetProductsByCategoryIntent extends ProductsByCategoryIntent {
  GetProductsByCategoryIntent(this.category, this.skip, this.limit);
  final String category;
  final int skip;
  final int limit;
}
