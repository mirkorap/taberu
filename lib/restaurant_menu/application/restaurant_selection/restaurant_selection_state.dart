part of 'restaurant_selection_cubit.dart';

@freezed
abstract class RestaurantSelectionState with _$RestaurantSelectionState {
  const factory RestaurantSelectionState.initial() = _Initial;

  const factory RestaurantSelectionState.searchInProgress() = _SearchInProgress;

  const factory RestaurantSelectionState.searchSuccess(KtList<Restaurant> restaurants) = _SearchSuccess;

  const factory RestaurantSelectionState.searchFailure(RestaurantFailure failure) = _SearchFailure;
}
