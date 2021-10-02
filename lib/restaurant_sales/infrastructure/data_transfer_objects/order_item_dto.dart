import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/quantity.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_dto.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';

part 'order_item_dto.freezed.dart';

part 'order_item_dto.g.dart';

@freezed
class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required String id,
    required DishDto dish,
    required int quantity,
    required int unitPrice,
    required int totalPrice,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

  factory OrderItemDto.fromDomain(OrderItem orderItem) {
    return OrderItemDto(
      id: orderItem.id.getOrCrash(),
      dish: DishDto.fromDomain(orderItem.dish),
      quantity: orderItem.quantity.getOrCrash(),
      unitPrice: orderItem.unitPrice.amount.getOrCrash(),
      totalPrice: orderItem.totalPrice.amount.getOrCrash(),
    );
  }

  const OrderItemDto._();

  OrderItem toDomain() {
    return OrderItem(
      id: UniqueId.fromUniqueString(id),
      dish: dish.toDomain(),
      quantity: Quantity(quantity),
      unitPrice: Money(amount: unitPrice),
      totalPrice: Money(amount: totalPrice),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'quantity': quantity,
      'unit_price': unitPrice,
      'total_price': totalPrice,
    };
  }
}
