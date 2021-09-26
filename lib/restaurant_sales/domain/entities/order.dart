import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/core/infrastructure/extension_methods/kt_iterable.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_state.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_type.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/delivery_address.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/order_number.dart';

part 'order.freezed.dart';

@freezed
class Order with _$Order {
  factory Order({
    required UniqueId id,
    required Restaurant restaurant,
    required OrderNumber number,
    required OrderState state,
    required OrderType type,
    required Money adjustmentTotal,
    required Money subtotal,
    required Money total,
    required KtList<OrderItem> orderItems,
    required String notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    RestaurantTable? restaurantTable,
    DeliveryAddress? deliveryAddress,
  }) = _Order;

  factory Order.fromRestaurant(Restaurant restaurant) {
    return Order(
      id: UniqueId(),
      restaurant: restaurant,
      number: OrderNumber(1),
      state: OrderState.cart,
      type: OrderType.tableDelivery,
      adjustmentTotal: Money(amount: 0),
      subtotal: Money(amount: 0),
      total: Money(amount: 0),
      orderItems: emptyList(),
      notes: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  const Order._();

  bool get isDeliveredAtTable => type == OrderType.tableDelivery;

  bool get isDeliveredAtHome => type == OrderType.homeDelivery;

  Order changeToTableDelivery() {
    return copyWith(
      type: OrderType.tableDelivery,
      restaurantTable: null,
      deliveryAddress: null,
    );
  }

  Order changeToHomeDelivery() {
    return copyWith(
      type: OrderType.homeDelivery,
      restaurantTable: null,
      deliveryAddress: DeliveryAddress(),
    );
  }

  bool hasOrderItems() => orderItems.isNotEmpty();

  Order addOrderItem(OrderItem orderItem) {
    final existingOrderItem = this.orderItems.find((element) => element.containsDish(orderItem.dish));

    if (existingOrderItem != null) {
      final updatedOrderItem = existingOrderItem.increaseQuantity(orderItem.quantity);
      final orderItems = this.orderItems.replace(existingOrderItem, updatedOrderItem);
      return copyWith(orderItems: orderItems)._recalculateTotals();
    }

    final orderItems = this.orderItems.plusElement(orderItem);
    return copyWith(orderItems: orderItems)._recalculateTotals();
  }

  Order removeOrderItem(OrderItem orderItem) {
    final existingOrderItem = orderItems.find((element) => element.containsDish(orderItem.dish));

    if (existingOrderItem != null && existingOrderItem.quantity > orderItem.quantity) {
      final updatedOrderItem = existingOrderItem.decreaseQuantity(orderItem.quantity);
      final orderItems = this.orderItems.replace(existingOrderItem, updatedOrderItem);
      return copyWith(orderItems: orderItems)._recalculateTotals();
    }

    if (existingOrderItem != null && existingOrderItem.quantity == orderItem.quantity) {
      return deleteOrderItem(existingOrderItem);
    }

    return this;
  }

  Order deleteOrderItem(OrderItem orderItem) {
    final orderItems = this.orderItems.minusElement(orderItem);
    return copyWith(orderItems: orderItems)._recalculateTotals();
  }

  Order _recalculateTotals() {
    final subtotalAmount = orderItems.sumBy((orderItem) => orderItem.totalPrice.amount.getOrCrash());
    final totalAmount = subtotalAmount + adjustmentTotal.amount.getOrCrash();

    return copyWith(
      subtotal: Money(
        amount: subtotalAmount,
        currency: subtotal.currency.getOrCrash(),
      ),
      total: Money(
        amount: totalAmount,
        currency: total.currency.getOrCrash(),
      ),
    );
  }

  Order editDeliveryCity(String city) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(city: city),
      (e) => e.copyWith(city: city),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Order editDeliveryPostalCode(String postalCode) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(postalCode: postalCode),
      (e) => e.copyWith(postalCode: postalCode),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Order editDeliveryStreet(String street) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(street: street),
      (e) => e.copyWith(street: street),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Order editDeliveryFirstName(String firstName) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(firstName: firstName),
      (e) => e.copyWith(firstName: firstName),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Order editDeliveryLastName(String lastName) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(lastName: lastName),
      (e) => e.copyWith(lastName: lastName),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Order editDeliveryPhone(String phone) {
    final deliveryAddress = optionOf(this.deliveryAddress).fold(
      () => DeliveryAddress(phone: phone),
      (e) => e.copyWith(phone: phone),
    );

    return copyWith(deliveryAddress: deliveryAddress);
  }

  Option<ValueFailure<dynamic>> get failureOption {
    if (isDeliveredAtTable) {
      return optionOf(restaurantTable).fold(
        () => some(ValueFailure.empty(restaurantTable)),
        (_) => none(),
      );
    }

    if (isDeliveredAtHome) {
      return optionOf(deliveryAddress).fold(
        () => some(ValueFailure.empty(deliveryAddress)),
        (e) => e.failureOrUnit.fold((l) => some(l), (_) => none()),
      );
    }

    return none();
  }
}
