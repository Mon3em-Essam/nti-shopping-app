import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/product_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/usecase/products_by_category_get_usecase.dart';

part 'products_by_category_state.dart';
part 'products_by_category_intent.dart';

@Injectable(as: Cubit<ProductsByCategoryState>)
class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit() : super(ProductsByCategoryInitial());

  void intent(ProductsByCategoryIntent intent) {
    switch (intent) {
      case GetProductsByCategoryIntent():
        _getProductsByCategory(intent.category, intent.skip, intent.limit);
    }
  }

  Future<ResultApi<List<ProductByCategoryEntity>>> _getProductsByCategory(
    String category,
    int skip,
    int limit,
  ) async {
    emit(ProductsByCategoryLoading());
    final res = await serviceLocator<ProductsByCategoryGetUsecase>().invoke(
      category,
      skip,
      limit,
    );
    switch (res) {
      case Success<List<ProductByCategoryEntity>>():
        emit(ProductsByCategorySuccess());
        return Success(res.data);
      case Error<List<ProductByCategoryEntity>>():
        emit(ProductsByCategoryError());
        return Error(res.messageError);
    }
  }
}
