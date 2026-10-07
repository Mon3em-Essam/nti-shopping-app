import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_by_category_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit() : super(ProductsByCategoryInitial());
}
