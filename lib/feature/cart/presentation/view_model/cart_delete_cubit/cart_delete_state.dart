part of 'cart_delete_cubit.dart';

@immutable
sealed class CartDeleteState {}

final class CartDeleteInitial extends CartDeleteState {}

final class CartDeleteLoading extends CartDeleteState {}

final class CartDeleteSuccess extends CartDeleteState {
  CartDeleteSuccess(this.message);
  final String message;
}

final class CartDeleteError extends CartDeleteState {
  CartDeleteError(this.message);
  final String message;
}
