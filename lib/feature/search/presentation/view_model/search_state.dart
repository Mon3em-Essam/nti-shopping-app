part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchInitialLoading extends SearchState {}

final class SearchEmpty extends SearchState {}

final class SearchSuccess extends SearchState {
  SearchSuccess(this.data);
  final List<SearchProductEntity> data;
}

final class SearchError extends SearchState {
  SearchError(this.error);
  final String error;
}

final class SearchLoading extends SearchState {
  SearchLoading(this.data);
  final List<SearchProductEntity> data;
}
