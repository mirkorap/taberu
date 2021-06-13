part of 'restaurant_search_cubit.dart';

@freezed
class RestaurantSearchState with _$RestaurantSearchState {
  const factory RestaurantSearchState.initial() = _Initial;

  const factory RestaurantSearchState.searchInProgress() = _SearchInProgress;

  const factory RestaurantSearchState.searchSuccess(KtList<Restaurant> restaurants) = _SearchSuccess;

  const factory RestaurantSearchState.searchFailure(RestaurantFailure failure) = _SearchFailure;
}
