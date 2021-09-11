import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';

part 'menu.freezed.dart';

@freezed
class Menu with _$Menu {
  const factory Menu({
    required UniqueId id,
    required UniqueId restaurantId,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Menu;
}
