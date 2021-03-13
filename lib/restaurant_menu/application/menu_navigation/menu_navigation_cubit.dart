import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/domain/failures/menu_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_menu_repository.dart';

part 'menu_navigation_cubit.freezed.dart';

part 'menu_navigation_state.dart';

@injectable
class MenuNavigationCubit extends Cubit<MenuNavigationState> {
  final ISelectedRestaurantStorage _storage;
  final IMenuRepository _menuRepository;
  StreamSubscription<Either<MenuFailure, KtList<Menu>>> _menuStreamSubscription;

  MenuNavigationCubit(
    this._storage,
    this._menuRepository,
  ) : super(const MenuNavigationState.initial());

  void loadFromSelectedRestaurant() {
    emit(const MenuNavigationState.loadInProgress());

    final selectedRestaurant = _storage.getRestaurant();
    final selectedRestaurantId = selectedRestaurant.id.getOrCrash();

    _menuStreamSubscription?.cancel();
    _menuStreamSubscription = _menuRepository.searchByRestaurant(selectedRestaurantId).listen((failureOrMenus) {
      failureOrMenus.fold(
        (l) => emit(MenuNavigationState.loadFailure(l)),
        (r) => emit(MenuNavigationState.loadSuccess(r)),
      );
    });
  }
}
