import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/category_item_entity.dart';
import 'package:nti_shopping_app/feature/home/domain/entities/product_response_entity.dart';
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_categories_use_case.dart';
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_products_use_case.dart';

part 'home_state.dart';
part 'home_intent.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getAllProductsUseCase, this._getAllCategoriesUseCase)
    : super(HomeInitial());

  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;

  List<ProductItemEntity> products = [];
  List<CategoryItemEntity> categories = [];

  Future<void> intent(HomeIntent intent) async {
    switch (intent) {
      case HIProducts():
        await _getProducts();
      case HICategories():
        await _getCategories();
      case HIHomeCalls():
        await Future.wait([_getProducts(), _getCategories()]);
    }
  }

  Future<void> _getProducts() async {
    emit(HProductsLoading());
    final result = await _getAllProductsUseCase.invoke();
    switch (result) {
      case Success<ProductResponseEntity>():
        products = result.data.list; 
        emit(HProductsSuccess(products));
      case Error<ProductResponseEntity>():
        emit(HProductsError(result.messageError));
    }
  }

  Future<void> _getCategories() async {
    emit(HICategoriesLoading());
    final result = await _getAllCategoriesUseCase.invoke();
    switch (result) {
      case Success<List<CategoryItemEntity>>():
        categories = result.data; 
        emit(HICategoriesSuccess(categories));
      case Error<List<CategoryItemEntity>>():
        emit(HICategoriesError(result.messageError));
    }
  }
}
