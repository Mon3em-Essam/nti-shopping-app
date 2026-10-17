import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_add_use_case.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_add_cubit/cart_add_intent.dart';

part 'cart_add_state.dart';

@injectable
class CartAddCubit extends Cubit<CartAddState> {
  CartAddCubit(this._useCase) : super(CartAddInitial());
  final CartAddUseCase _useCase;

  void intent(CartAddIntent intent) {
    switch (intent) {
      case CartAddItem():
        _addItem(intent.productId);
    }
  }

  void _addItem(String productId) async {
    emit(CartAddLoading());
    final res = await _useCase.invoke(productId);
    switch (res) {
      case Success<String>():
        emit(CartAddSuccess(res.data));
      case Error<String>():
        emit(CartAddError(res.messageError));
    }
  }
}
