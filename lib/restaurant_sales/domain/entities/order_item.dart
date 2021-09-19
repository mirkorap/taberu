import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/quantity.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

part 'order_item.freezed.dart';

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required UniqueId id,
    required UniqueId dishId,
    required Quantity quantity,
    required Money unitPrice,
    required Money totalPrice,
  }) = _OrderItem;

  factory OrderItem.fromDish(Dish dish) {
    return OrderItem(
      id: UniqueId(),
      dishId: dish.id,
      quantity: Quantity(1),
      unitPrice: dish.price,
      totalPrice: dish.price,
    );
  }

  const OrderItem._();

  bool containsDish(UniqueId dishId) => this.dishId == dishId;

  OrderItem increaseQuantity(Quantity quantity) {
    return updateQuantity(this.quantity + quantity);
  }

  OrderItem decreaseQuantity(Quantity quantity) {
    return updateQuantity(this.quantity - quantity);
  }

  OrderItem updateQuantity(Quantity quantity) {
    return copyWith(
      quantity: quantity,
      totalPrice: Money(
        amount: unitPrice.amount.getOrCrash() * quantity.getOrCrash(),
        currency: unitPrice.currency.getOrCrash(),
      ),
    );
  }
}
