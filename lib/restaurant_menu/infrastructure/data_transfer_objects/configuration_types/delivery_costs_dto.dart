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
    required int value,
    required int createdAt,
    required int updatedAt,
  }) = _DeliveryCostsDto;

  factory DeliveryCostsDto.fromJson(Map<String, dynamic> json) => _$DeliveryCostsDtoFromJson(json);

  factory DeliveryCostsDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final json = Map.fromEntries([...data.entries, MapEntry('id', doc.id)]);

    return DeliveryCostsDto.fromJson(json);
  }

  const DeliveryCostsDto._();

  @override
  Configuration<Money> toDomain() {
    return Configuration<Money>(
      id: UniqueId.fromUniqueString(id),
      value: Money(amount: value),
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
