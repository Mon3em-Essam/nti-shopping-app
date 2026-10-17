import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_get_use_case.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_get_cubit/cart_get_intent.dart';

part 'cart_get_state.dart';

@injectable
class CartGetCubit extends Cubit<CartGetState> {
  CartGetCubit(this._useCase) : super(CartGetInitial());
  final CartGetUseCase _useCase;

  void intent(CartGetIntent intent) async {
    switch (intent) {
      case CartGetAllItems():
        _getAllItems();
    }
  }

  void _getAllItems() async {
    emit(CartGetLoading());
    final res = await _useCase.invoke();

    if (isClosed) {
      return; // guard clause to prevent emitting a state if the cubit is closed
    }
    switch (res) {
      case Success<List<CartEntity>>():
        final data = res.data;
        emit(CartGetSuccess(data));
      case Error<List<CartEntity>>():
        final errorMsg = res.messageError;
        emit(CartGetError(errorMsg));
    }
  }
}
