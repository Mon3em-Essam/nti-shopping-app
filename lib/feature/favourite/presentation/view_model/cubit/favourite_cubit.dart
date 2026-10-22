import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';
import 'package:nti_shopping_app/feature/favourite/domain/use_case/get_favourite_use_case.dart';
import 'package:nti_shopping_app/feature/favourite/domain/use_case/remove_favourite_use_case.dart';

part 'favourite_state.dart';
part 'favourite_intent.dart';

@injectable
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.getFavouriteUseCase, this.removeFavouriteUseCase)
    : super(FavouriteInitial());

  final GetFavouriteUseCase getFavouriteUseCase;
  final RemoveFavouriteUseCase removeFavouriteUseCase;

  bool initialLoading = true;
  final List<FavouriteEntity> data = [];

  void intent(FavouriteIntent intent) {
    switch (intent) {
      case GetFavouritesIntent():
        _getFavourites();
      case AddToFavouriteIntent():
        break;
      case RemoveFromFavouriteIntent():
        _removeFromFavourite(intent.productId);
    }
  }

  void _getFavourites() async {
    if (initialLoading) {
      initialLoading = false;
      emit(FavouriteInitialLoading());
    } else {
      emit(FavouriteLoading(data));
    }

    final res = await getFavouriteUseCase.invoke();
    switch (res) {
      case Success<List<FavouriteEntity>>():
        data.clear();
        data.addAll(res.data);
        emit(FavouriteSuccess(List.of(data)));

      case Error<List<FavouriteEntity>>():
        emit(FavouriteError(res.messageError));
    }
  }

  void _removeFromFavourite(int productId) async {
    final res = await removeFavouriteUseCase.invoke(productId);
    switch (res) {
      case Success<bool>():
        data.removeWhere((element) => element.id == productId);
        emit(FavouriteSuccess(List.of(data)));

      case Error<bool>():
        emit(FavouriteError(res.messageError));
    }
  }
}
