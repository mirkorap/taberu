import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';

part 'menu_dto.freezed.dart';

part 'menu_dto.g.dart';

@freezed
class MenuDto with _$MenuDto {
  const factory MenuDto({
    required String id,
    required String restaurantId,
    required String name,
    required int createdAt,
    required int updatedAt,
  }) = _MenuDto;

  factory MenuDto.fromJson(Map<String, dynamic> json) => _$MenuDtoFromJson(json);

  factory MenuDto.fromDomain(Menu menu) {
    return MenuDto(
      id: menu.id.getOrCrash(),
      restaurantId: menu.restaurantId.getOrCrash(),
      name: menu.name,
      createdAt: menu.createdAt.millisecondsSinceEpoch,
      updatedAt: menu.updatedAt.millisecondsSinceEpoch,
    );
  }

  factory MenuDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final restaurantId = doc.reference.parent.parent!.id;

    final json = Map.fromEntries([
      MapEntry('id', doc.id),
      MapEntry('restaurant_id', restaurantId),
      ...data.entries,
    ]);

    return MenuDto.fromJson(json);
  }

  const MenuDto._();

  Menu toDomain() {
    return Menu(
      id: UniqueId.fromUniqueString(id),
      restaurantId: UniqueId.fromUniqueString(restaurantId),
      name: name,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
