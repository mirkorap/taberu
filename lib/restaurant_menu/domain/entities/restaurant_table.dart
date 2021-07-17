import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';

part 'restaurant_table.freezed.dart';

@freezed
class RestaurantTable with _$RestaurantTable {
  const factory RestaurantTable({
    required UniqueId id,
    required String name,
  }) = _RestaurantTable;
}
