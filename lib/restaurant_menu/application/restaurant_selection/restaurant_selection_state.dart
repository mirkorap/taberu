part of 'restaurant_selection_cubit.dart';

@freezed
class RestaurantSelectionState with _$RestaurantSelectionState {
  const factory RestaurantSelectionState.initial() = _Initial;

  const factory RestaurantSelectionState.actionInProgress() = _ActionInProgress;

  const factory RestaurantSelectionState.restaurantSelected(Restaurant restaurant) = _RestaurantSelected;
}
