part of 'search_cubit.dart';

sealed class SearchIntent {}

class SearchQueryChangedIntent extends SearchIntent {
  SearchQueryChangedIntent(this.query);
  final String query;
}

class LoadMoreSearchIntent extends SearchIntent {}
