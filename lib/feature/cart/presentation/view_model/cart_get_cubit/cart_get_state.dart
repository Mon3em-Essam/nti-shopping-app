part of 'cart_get_cubit.dart';

@immutable
sealed class CartGetState {}

final class CartGetInitial extends CartGetState {}

final class CartGetLoading extends CartGetState {}

final class CartGetSuccess extends CartGetState {
  final List<CartEntity> cartItems;
  CartGetSuccess(this.cartItems);
}

final class CartGetError extends CartGetState {
  final String errorMsg;
  CartGetError(this.errorMsg);
}
