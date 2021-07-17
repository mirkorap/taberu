import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';

part 'restaurant_table_dto.freezed.dart';

part 'restaurant_table_dto.g.dart';

@freezed
class RestaurantTableDto with _$RestaurantTableDto {
  const factory RestaurantTableDto({
    required String id,
    required String name,
  }) = _RestaurantTableDto;

  factory RestaurantTableDto.fromJson(Map<String, dynamic> json) => _$RestaurantTableDtoFromJson(json);

  factory RestaurantTableDto.fromDomain(RestaurantTable restaurantTable) {
    return RestaurantTableDto(
      id: restaurantTable.id.getOrCrash(),
      name: restaurantTable.name,
    );
  }

  const RestaurantTableDto._();

  RestaurantTable toDomain() {
    return RestaurantTable(
      id: UniqueId.fromUniqueString(id),
      name: name,
    );
  }
}
