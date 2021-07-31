import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
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

  const Order._();

  bool get isDeliveredAtHome => type == OrderType.homeDelivery;

  bool get isDeliveredAtTable => type == OrderType.tableDelivery;
}
