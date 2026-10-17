sealed class CartAddIntent {}

final class CartAddItem extends CartAddIntent {
  CartAddItem(this.productId);
  final String productId;
}
