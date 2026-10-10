import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/products_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/usecase/products_by_category_get_usecase.dart';

part 'products_by_category_state.dart';
part 'products_by_category_intent.dart';

@injectable
class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit(this.useCase) : super(ProductsByCategoryInitial());
  ProductsByCategoryGetUsecase useCase;

  int skip = 0;
  int limit = 10;
  bool dataEnded = false;
  bool intialLoading = true;
  bool isLoadingMore = false;
  final List<ProductsByCategoryEntity> data = [];

  void intent(ProductsByCategoryIntent intent) {
    switch (intent) {
      case GetProductsByCategoryIntent():
        _getProductsByCategory(intent.category);
    }
  }

  void _getProductsByCategory(String category) async {
    if (dataEnded || isLoadingMore) return;
    isLoadingMore = true;

    if (intialLoading) {
      intialLoading = false;
      emit(ProductsByCategoryInitialLoading());
    } else {
      emit(ProductsByCategoryLoading(data));
    }

    final res = await useCase.invoke(category, skip, limit);
    isLoadingMore = false;
    switch (res) {
      case Success<List<ProductsByCategoryEntity>>():
        if (res.data.isEmpty) {
          dataEnded = true;
        }
        data.addAll(res.data);
        skip += 10;
        emit(ProductsByCategorySuccess(data));

      case Error<List<ProductsByCategoryEntity>>():
        emit(ProductsByCategoryError(res.messageError));
    }
  }
}
