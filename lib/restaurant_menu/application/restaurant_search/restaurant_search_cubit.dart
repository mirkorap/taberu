import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/failures/restaurant_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_restaurant_repository.dart';

part 'restaurant_search_cubit.freezed.dart';

part 'restaurant_search_state.dart';

@injectable
class RestaurantSearchCubit extends Cubit<RestaurantSearchState> {
  final IRestaurantRepository _restaurantRepository;
  StreamSubscription<Either<RestaurantFailure, KtList<Restaurant>>>? _restaurantStreamSubscription;

  RestaurantSearchCubit(this._restaurantRepository) : super(const RestaurantSearchState.initial());

  void searchByName(String name) {
    emit(const RestaurantSearchState.searchInProgress());

    _restaurantStreamSubscription?.cancel();
    _restaurantStreamSubscription = _restaurantRepository.searchByName(name).listen((failureOrRestaurants) {
      failureOrRestaurants.fold(
        (l) => emit(RestaurantSearchState.searchFailure(l)),
        (r) => emit(RestaurantSearchState.searchSuccess(r)),
      );
    });
  }
}
