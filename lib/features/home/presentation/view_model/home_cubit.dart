import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/domain/entities/product_response_entity.dart';
import 'package:nti_shopping_app/features/home/domain/use_case/get_all_products_use_case.dart';

part 'home_state.dart';
part 'home_intent.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAllProductsUseCase) : super(HomeInitial());
  final GetAllProductsUseCase _getAllProductsUseCase;

  Future<void> intent(HomeIntent intent) async {
    switch (intent) {
      case HIProducts():
        await _getProducts();
    }
  }

  Future<void> _getProducts() async {
    emit(HProductsLoading());
    final result = await _getAllProductsUseCase.invoke();
    switch (result) {
      case Success<ProductResponseEntity>():
        final listProduct = result.data.list;
        emit(HProductsSuccess(listProduct));
      case Error<ProductResponseEntity>():
        emit(HProductsError(result.messageError));
    }
  }
}
