import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/configuration_type_dto.dart';

part 'delivery_costs_dto.freezed.dart';

part 'delivery_costs_dto.g.dart';

@freezed
class DeliveryCostsDto with _$DeliveryCostsDto implements ConfigurationTypeDto<Money> {
  const factory DeliveryCostsDto({
    required String id,
    required String restaurantId,
    required int value,
    required int createdAt,
    required int updatedAt,
  }) = _DeliveryCostsDto;

  factory DeliveryCostsDto.fromJson(Map<String, dynamic> json) => _$DeliveryCostsDtoFromJson(json);

  factory DeliveryCostsDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final restaurantId = doc.reference.parent.parent!.path;

    final json = Map.fromEntries([
      MapEntry('id', doc.id),
      MapEntry('restaurant_id', restaurantId),
      ...data.entries,
    ]);

    return DeliveryCostsDto.fromJson(json);
  }

  const DeliveryCostsDto._();

  @override
  Configuration<Money> toDomain() {
    return Configuration<Money>(
      id: UniqueId.fromUniqueString(id),
      restaurantId: UniqueId.fromUniqueString(restaurantId),
      value: Money(amount: value),
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
