import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_dto.dart';

part 'menu_dto.freezed.dart';

part 'menu_dto.g.dart';

@freezed
abstract class MenuDto implements _$MenuDto {
  const factory MenuDto({
    @required String id,
    @required String name,
    @JsonKey(defaultValue: []) List<DishDto> dishes,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);

  factory MenuDto.fromDomain(Menu menu) {
    return MenuDto(
      id: menu.id.getOrCrash(),
      name: menu.name,
      dishes: menu.dishes.map((dish) => DishDto.fromDomain(dish)).asList(),
    );
  }

  factory MenuDto.fromFirestore(DocumentSnapshot doc) {
    final data = Map.fromEntries([...doc.data().entries, MapEntry('id', doc.id)]);

    return MenuDto.fromJson(data);
  }

  // ignore: unused_element
  const MenuDto._();

  Menu toDomain() {
    return Menu(
      id: UniqueId.fromUniqueString(id),
      name: name,
      dishes: dishes.map((item) => item.toDomain()).toImmutableList(),
    );
  }
}
