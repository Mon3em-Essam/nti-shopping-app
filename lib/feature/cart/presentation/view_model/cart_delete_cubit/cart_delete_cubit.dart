import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_delete_use_case.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_delete_cubit/cart_delete_intent.dart';

part 'cart_delete_state.dart';

class CartDeleteCubit extends Cubit<CartDeleteState> {
  CartDeleteCubit(this._useCase) : super(CartDeleteInitial());
  final CartDeleteUseCase _useCase;

  void intent(CartDeleteIntent intent) {
    switch (intent) {
      case CartDeleteItem(:final productId):
        _deleteItem(productId);
    }
  }

  void _deleteItem(String productId) async {
    emit(CartDeleteLoading());
    final result = await _useCase.invoke(productId);
    switch (result) {
      case Success<String>():
        emit(CartDeleteSuccess(result.data));
      case Error<String>():
        emit(CartDeleteError(result.messageError));
    }
  }
}
