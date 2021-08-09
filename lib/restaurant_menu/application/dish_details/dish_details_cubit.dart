import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

part 'dish_details_cubit.freezed.dart';

part 'dish_details_state.dart';

@injectable
class DishDetailsCubit extends Cubit<DishDetailsState> {
  DishDetailsCubit() : super(const DishDetailsState.initial());

  void addDishToOrder(Dish dish) {
    emit(const DishDetailsState.actionInProgress());

    Timer(StiloDuration.d1000, () => emit(DishDetailsState.dishToOrderButtonPressed(dish)));
  }
}
