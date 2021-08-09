part of 'cart_order_cubit.dart';

@freezed
class CartOrderState with _$CartOrderState {
  const factory CartOrderState({
    required Order order,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<OrderFailure, Unit>> saveFailureOrSuccessOption,
  }) = _CartOrderState;

  factory CartOrderState.initial() {
    return CartOrderState(
      order: Order.empty(),
      isEditing: false,
      isSaving: false,
      saveFailureOrSuccessOption: none(),
    );
  }
}
