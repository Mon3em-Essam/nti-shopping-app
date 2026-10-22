import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';
import 'package:nti_shopping_app/feature/search/domain/use_case/search_use_case.dart';

part 'search_state.dart';
part 'search_intent.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.useCase) : super(SearchInitial());
  final SearchUseCase useCase;

  int skip = 0;
  int limit = 10;
  bool dataEnded = false;
  bool initialLoading = true;
  bool isLoadingMore = false;
  String currentQuery = '';
  final List<SearchProductEntity> data = [];
  Timer? _debounce;

  void intent(SearchIntent intent) {
    switch (intent) {
      case SearchQueryChangedIntent():
        _onQueryChanged(intent.query);
      case LoadMoreSearchIntent():
        _searchProducts();
    }
  }

  void _onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    final trimmedQuery = query.trim();
    if (trimmedQuery.isEmpty) {
      currentQuery = '';
      data.clear();
      emit(SearchInitial());
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      currentQuery = trimmedQuery;
      skip = 0;
      dataEnded = false;
      initialLoading = true;
      isLoadingMore = false;
      data.clear();
      _searchProducts();
    });
  }

  Future<void> _searchProducts() async {
    if (currentQuery.isEmpty || dataEnded || isLoadingMore) return;
    isLoadingMore = true;

    if (initialLoading) {
      initialLoading = false;
      emit(SearchInitialLoading());
    } else {
      emit(SearchLoading(List.from(data)));
    }

    final res = await useCase.invoke(
      query: currentQuery,
      skip: skip,
      limit: limit,
    );
    isLoadingMore = false;

    switch (res) {
      case Success<List<SearchProductEntity>>():
        if (res.data.isEmpty) {
          dataEnded = true;
          if (data.isEmpty) {
            emit(SearchEmpty());
          } else {
            emit(SearchSuccess(List.from(data)));
          }
          return;
        }

        skip += limit;
        if (res.data.length < limit) {
          dataEnded = true;
        }

        final queryLower = currentQuery.toLowerCase();
        final filteredList = res.data.where((product) {
          return product.title.toLowerCase().contains(queryLower);
        }).toList();

        data.addAll(filteredList);

        if (data.isEmpty) {
          if (!dataEnded) {
            _searchProducts();
            return;
          }
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(List.from(data)));
        }

     case Error<List<SearchProductEntity>>():
        if (data.isNotEmpty) {
          emit(SearchSuccess(List.from(data)));
        } else {
          dataEnded = true;
          emit(SearchEmpty());
        }
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
