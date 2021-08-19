part of 'restaurant_configuration_cubit.dart';

@freezed
class RestaurantConfigurationState with _$RestaurantConfigurationState {
  const factory RestaurantConfigurationState.initial() = _Initial;

  const factory RestaurantConfigurationState.loadInProgress() = _LoadInProgress;

  const factory RestaurantConfigurationState.loadSuccess(KtList<Configuration> configurations) = _LoadSuccess;

  const factory RestaurantConfigurationState.loadFailure(ConfigurationFailure failure) = _LoadFailure;
}
