import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/core/infrastructure/extension_methods/kt_iterable.dart';
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
    required OrderNumber number,
    required OrderState state,
    required OrderType type,
    required Money adjustmentTotal,
    required Money subtotal,
    required Money total,
    required KtList<OrderItem> orderItems,
    required DateTime createdAt,
    required DateTime updatedAt,
    DeliveryAddress? deliveryAddress,
    RestaurantTable? restaurantTable,
    String? notes,
  }) = _Order;

  factory Order.empty() {
    return Order(
      id: UniqueId(),
      number: OrderNumber(1),
      state: OrderState.cart,
      type: OrderType.tableDelivery,
      adjustmentTotal: Money(amount: 0),
      subtotal: Money(amount: 0),
      total: Money(amount: 0),
      orderItems: emptyList(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  const Order._();

  Order addOrderItem(OrderItem orderItem) {
    final existingOrderItem = this.orderItems.find((element) => element.dish == orderItem.dish);

    if (existingOrderItem != null) {
      final updatedOrderItem = existingOrderItem.increaseQuantity(orderItem.quantity);
      final orderItems = this.orderItems.replace(existingOrderItem, updatedOrderItem);
      return copyWith(orderItems: orderItems).recalculateTotals();
    }

    final orderItems = this.orderItems.plusElement(orderItem);
    return copyWith(orderItems: orderItems).recalculateTotals();
  }

  Order removeOrderItem(OrderItem orderItem) {
    final existingOrderItem = orderItems.find((element) => element.dish == orderItem.dish);

    if (existingOrderItem != null && existingOrderItem.quantity > orderItem.quantity) {
      final updatedOrderItem = existingOrderItem.decreaseQuantity(orderItem.quantity);
      final orderItems = this.orderItems.replace(existingOrderItem, updatedOrderItem);
      return copyWith(orderItems: orderItems).recalculateTotals();
    }

    if (existingOrderItem != null && existingOrderItem.quantity == orderItem.quantity) {
      return deleteOrderItem(existingOrderItem);
    }

    return this;
  }

  Order deleteOrderItem(OrderItem orderItem) {
    final orderItems = this.orderItems.minusElement(orderItem);
    return copyWith(orderItems: orderItems).recalculateTotals();
  }

  Order recalculateTotals() {
    final subtotalAmount = orderItems.sumBy((orderItem) => orderItem.totalPrice.amount.getOrCrash());
    final totalAmount = adjustmentTotal.amount.getOrCrash() + subtotalAmount;

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

  bool get isDeliveredAtHome => type == OrderType.homeDelivery;

  bool get isDeliveredAtTable => type == OrderType.tableDelivery;
}
