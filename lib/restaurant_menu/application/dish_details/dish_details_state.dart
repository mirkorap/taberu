part of 'dish_details_cubit.dart';

@freezed
class DishDetailsState with _$DishDetailsState {
  const factory DishDetailsState.initial() = _Initial;

  const factory DishDetailsState.actionInProgress() = _ActionInProgress;

  const factory DishDetailsState.dishToCartButtonPressed(Dish dish) = _DishToCartButtonPressed;
}
