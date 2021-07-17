import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/configuration_type_dto.dart';

part 'cover_charge_dto.freezed.dart';

part 'cover_charge_dto.g.dart';

@freezed
class CoverChargeDto with _$CoverChargeDto implements ConfigurationTypeDto<Money> {
  const factory CoverChargeDto({
    required String id,
    required int value,
    required int createdAt,
    required int updatedAt,
  }) = _CoverChargeDto;

  factory CoverChargeDto.fromJson(Map<String, dynamic> json) => _$CoverChargeDtoFromJson(json);

  factory CoverChargeDto.fromDomain(Configuration<Money> configuration) {
    return CoverChargeDto(
      id: configuration.id.getOrCrash(),
      value: configuration.value.amount.getOrCrash(),
      createdAt: configuration.createdAt.millisecondsSinceEpoch,
      updatedAt: configuration.updatedAt.millisecondsSinceEpoch,
    );
  }

  factory CoverChargeDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final json = Map.fromEntries([...data.entries, MapEntry('id', doc.id)]);

    return CoverChargeDto.fromJson(json);
  }

  const CoverChargeDto._();

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
