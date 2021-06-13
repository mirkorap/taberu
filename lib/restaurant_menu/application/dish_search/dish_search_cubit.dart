import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/domain/failures/dish_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_dish_repository.dart';
import 'package:taberu/restaurant_menu/domain/search_criteria/dish_search_criteria.dart';

part 'dish_search_cubit.freezed.dart';

part 'dish_search_state.dart';

typedef DishRepositorySearchByAction = Stream<Either<DishFailure, KtList<Dish>>> Function(
  DishSearchCriteria criteria,
);

@injectable
class DishSearchCubit extends Cubit<DishSearchState> {
  final ISelectedRestaurantStorage _storage;
  final IDishRepository _dishRepository;
  StreamSubscription<Either<DishFailure, KtList<Dish>>>? _dishStreamSubscription;

  DishSearchCubit(
    this._storage,
    this._dishRepository,
  ) : super(const DishSearchState.initial());

  void searchByMenu(String menuId) {
    final criteria = DishSearchCriteria(menuId: menuId);

    _performSearchOnDishRepository(criteria, _dishRepository.searchByMenu);
  }

  void searchByName(String name) {
    final criteria = DishSearchCriteria(name: name);

    _performSearchOnDishRepository(criteria, _dishRepository.searchByName);
  }

  void _performSearchOnDishRepository(
    DishSearchCriteria forwardedCriteria,
    DishRepositorySearchByAction forwardedCall,
  ) {
    emit(const DishSearchState.searchInProgress());

    final selectedRestaurant = _storage.getRestaurant();
    final selectedRestaurantId = selectedRestaurant.id.getOrCrash();

    final criteria = forwardedCriteria.copyWith(
      restaurantId: selectedRestaurantId,
    );

    _dishStreamSubscription?.cancel();
    _dishStreamSubscription = forwardedCall(criteria).listen((failureOrDishes) {
      failureOrDishes.fold(
        (l) => emit(DishSearchState.searchFailure(l)),
        (r) => emit(DishSearchState.searchSuccess(r)),
      );
    });
  }
}
