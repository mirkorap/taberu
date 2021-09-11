import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/quantity.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_sales/domain/entities/order_item.dart';

part 'order_item_dto.freezed.dart';

part 'order_item_dto.g.dart';

@freezed
class OrderItemDto with _$OrderItemDto {
  const factory OrderItemDto({
    required String id,
    required String dishId,
    required int quantity,
    required int unitPrice,
    required int totalPrice,
  }) = _OrderItemDto;

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);

  factory OrderItemDto.fromDomain(OrderItem orderItem) {
    return OrderItemDto(
      id: orderItem.id.getOrCrash(),
      dishId: orderItem.dishId.getOrCrash(),
      quantity: orderItem.quantity.getOrCrash(),
      unitPrice: orderItem.unitPrice.amount.getOrCrash(),
      totalPrice: orderItem.totalPrice.amount.getOrCrash(),
    );
  }

  const OrderItemDto._();

  OrderItem toDomain() {
    return OrderItem(
      id: UniqueId.fromUniqueString(id),
      dishId: UniqueId.fromUniqueString(dishId),
      quantity: Quantity(quantity),
      unitPrice: Money(amount: unitPrice),
      totalPrice: Money(amount: totalPrice),
    );
  }
}
