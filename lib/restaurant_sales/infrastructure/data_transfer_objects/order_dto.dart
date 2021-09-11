import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' show optionOf;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_values/restaurant_table_dto.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_state.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_type.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/order_number.dart';
import 'package:taberu/restaurant_sales/infrastructure/data_transfer_objects/delivery_address_dto.dart';
import 'package:taberu/restaurant_sales/infrastructure/data_transfer_objects/order_item_dto.dart';

part 'order_dto.freezed.dart';

part 'order_dto.g.dart';

@freezed
class OrderDto with _$OrderDto {
  const factory OrderDto({
    required String id,
    required String restaurantId,
    required String number,
    required String state,
    required String type,
    required int adjustmentTotal,
    required int subtotal,
    required int total,
    required List<OrderItemDto> orderItems,
    required String notes,
    required int createdAt,
    required int updatedAt,
    @JsonKey(defaultValue: null) @Default(null) RestaurantTableDto? restaurantTable,
    @JsonKey(defaultValue: null) @Default(null) DeliveryAddressDto? deliveryAddress,
  }) = _OrderDto;

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  factory OrderDto.fromDomain(Order order) {
    final restaurantTable = optionOf(order.restaurantTable).fold(() => null, (e) => RestaurantTableDto.fromDomain(e));
    final deliveryAddress = optionOf(order.deliveryAddress).fold(() => null, (e) => DeliveryAddressDto.fromDomain(e));

    return OrderDto(
      id: order.id.getOrCrash(),
      restaurantId: order.restaurantId.getOrCrash(),
      number: order.number.toString(),
      state: EnumToString.convertToString(order.state),
      type: EnumToString.convertToString(order.type),
      adjustmentTotal: order.adjustmentTotal.amount.getOrCrash(),
      subtotal: order.subtotal.amount.getOrCrash(),
      total: order.total.amount.getOrCrash(),
      orderItems: order.orderItems.map((orderItem) => OrderItemDto.fromDomain(orderItem)).asList(),
      notes: order.notes,
      createdAt: order.createdAt.millisecondsSinceEpoch,
      updatedAt: order.updatedAt.millisecondsSinceEpoch,
      restaurantTable: restaurantTable,
      deliveryAddress: deliveryAddress,
    );
  }

  factory OrderDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final restaurantId = doc.reference.parent.parent!.id;

    final json = Map.fromEntries([
      MapEntry('id', doc.id),
      MapEntry('restaurant_id', restaurantId),
      ...data.entries,
    ]);

    return OrderDto.fromJson(json);
  }

  const OrderDto._();

  Order toDomain() {
    return Order(
      id: UniqueId.fromUniqueString(id),
      restaurantId: UniqueId.fromUniqueString(restaurantId),
      number: OrderNumber.fromString(number),
      state: EnumToString.fromString(OrderState.values, state)!,
      type: EnumToString.fromString(OrderType.values, type)!,
      adjustmentTotal: Money(amount: adjustmentTotal),
      subtotal: Money(amount: subtotal),
      total: Money(amount: total),
      orderItems: orderItems.map((orderItem) => orderItem.toDomain()).toImmutableList(),
      notes: notes,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
      restaurantTable: restaurantTable?.toDomain(),
      deliveryAddress: deliveryAddress?.toDomain(),
    );
  }
}
