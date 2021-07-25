import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

part 'dish_actor_cubit.freezed.dart';

part 'dish_actor_state.dart';

@injectable
class DishActorCubit extends Cubit<DishActorState> {
  DishActorCubit() : super(const DishActorState.initial());

  void addToOrder(Dish dish) {
    emit(const DishActorState.actionInProgress());

    Timer(StiloDuration.d1000, () => emit(DishActorState.dishAddedToOrder(dish)));
  }
}
