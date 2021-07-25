part of 'dish_actor_cubit.dart';

@freezed
class DishActorState with _$DishActorState {
  const factory DishActorState.initial() = _Initial;

  const factory DishActorState.actionInProgress() = _ActionInProgress;

  const factory DishActorState.dishAddedToOrder(Dish dish) = _DishAddedToOrder;
}
