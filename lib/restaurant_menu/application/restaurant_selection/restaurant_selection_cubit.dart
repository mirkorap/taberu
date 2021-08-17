import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';

part 'restaurant_selection_cubit.freezed.dart';

part 'restaurant_selection_state.dart';

@injectable
class RestaurantSelectionCubit extends Cubit<RestaurantSelectionState> {
  final ISelectedRestaurantStorage _selectedRestaurantStorage;

  RestaurantSelectionCubit(this._selectedRestaurantStorage) : super(const RestaurantSelectionState.initial());

  Future<void> selectRestaurant(Restaurant restaurant) {
    emit(const RestaurantSelectionState.actionInProgress());

    return Future.delayed(StiloDuration.d1000, () async {
      await _selectedRestaurantStorage.setRestaurant(restaurant);
      emit(RestaurantSelectionState.restaurantSelected(restaurant));
    });
  }
}
