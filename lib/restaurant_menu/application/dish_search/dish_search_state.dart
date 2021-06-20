part of 'dish_search_cubit.dart';

@freezed
class DishSearchState with _$DishSearchState {
  const factory DishSearchState.initial() = _Initial;

  const factory DishSearchState.searchInProgress() = _SearchInProgress;

  const factory DishSearchState.searchSuccess(KtList<Dish> dishes) = _SearchSuccess;

  const factory DishSearchState.searchFailure(DishFailure failure) = _SearchFailure;
}
