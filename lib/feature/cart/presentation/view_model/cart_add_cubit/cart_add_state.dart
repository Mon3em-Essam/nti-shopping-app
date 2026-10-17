part of 'cart_add_cubit.dart';

@immutable
sealed class CartAddState {}

final class CartAddInitial extends CartAddState {}

final class CartAddLoading extends CartAddState {}

final class CartAddSuccess extends CartAddState {
  final String message;
  CartAddSuccess(this.message);
}

final class CartAddError extends CartAddState {
  final String message;
  CartAddError(this.message);
}
