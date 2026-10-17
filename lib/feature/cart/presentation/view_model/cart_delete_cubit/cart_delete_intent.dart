sealed class CartDeleteIntent {}

final class CartDeleteItem extends CartDeleteIntent {
  CartDeleteItem(this.productId);
  final String productId;
}
