import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/failures/configuration_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_configuration_repository.dart';

part 'restaurant_configuration_cubit.freezed.dart';

part 'restaurant_configuration_state.dart';

@injectable
class RestaurantConfigurationCubit extends Cubit<RestaurantConfigurationState> {
  final ISelectedRestaurantStorage _selectedRestaurantStorage;
  final IConfigurationRepository _configurationRepository;
  StreamSubscription<Either<ConfigurationFailure, KtList<Configuration>>>? _configurationStreamSubscription;

  RestaurantConfigurationCubit(
    this._selectedRestaurantStorage,
    this._configurationRepository,
  ) : super(const RestaurantConfigurationState.initial());

  void load() {
    emit(const RestaurantConfigurationState.loadInProgress());

    final selectedRestaurant = _selectedRestaurantStorage.getRestaurant();
    final selectedRestaurantId = selectedRestaurant.id.getOrCrash();

    _configurationStreamSubscription?.cancel();
    _configurationStreamSubscription = _configurationRepository.searchByRestaurant(selectedRestaurantId).listen(
      (failureOrConfigurations) {
        failureOrConfigurations.fold(
          (l) => emit(RestaurantConfigurationState.loadFailure(l)),
          (r) => emit(RestaurantConfigurationState.loadSuccess(r)),
        );
      },
    );
  }
}
