part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required Order order,
    required bool showErrorMessages,
    required bool isSaving,
    required Option<Either<OrderFailure, Unit>> saveFailureOrSuccessOption,
  }) = _CartState;

  factory CartState.initial(Restaurant restaurant) {
    return CartState(
      order: Order.fromRestaurant(restaurant),
      showErrorMessages: false,
      isSaving: false,
      saveFailureOrSuccessOption: none(),
    );
  }
}
