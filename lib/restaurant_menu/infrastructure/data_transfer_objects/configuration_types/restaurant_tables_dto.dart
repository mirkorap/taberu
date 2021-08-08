import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/configuration_type_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_values/restaurant_table_dto.dart';

part 'restaurant_tables_dto.freezed.dart';

part 'restaurant_tables_dto.g.dart';

@freezed
class RestaurantTablesDto with _$RestaurantTablesDto implements ConfigurationTypeDto<KtList<RestaurantTable>> {
  const factory RestaurantTablesDto({
    required String id,
    required List<RestaurantTableDto> value,
    required int createdAt,
    required int updatedAt,
  }) = _RestaurantTablesDto;

  factory RestaurantTablesDto.fromJson(Map<String, dynamic> json) => _$RestaurantTablesDtoFromJson(json);

  factory RestaurantTablesDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final json = Map.fromEntries([...data.entries, MapEntry('id', doc.id)]);

    return RestaurantTablesDto.fromJson(json);
  }

  const RestaurantTablesDto._();

  @override
  Configuration<KtList<RestaurantTable>> toDomain() {
    return Configuration<KtList<RestaurantTable>>(
      id: UniqueId.fromUniqueString(id),
      value: value.map((item) => item.toDomain()).toImmutableList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
