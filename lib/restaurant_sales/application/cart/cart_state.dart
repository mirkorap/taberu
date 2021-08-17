part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    required Order order,
    required bool isSaving,
    required Option<Either<OrderFailure, Unit>> saveFailureOrSuccessOption,
  }) = _CartState;

  factory CartState.initial() {
    return CartState(
      order: Order.empty(),
      isSaving: false,
      saveFailureOrSuccessOption: none(),
    );
  }
}
