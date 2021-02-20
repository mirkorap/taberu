import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/image.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish_image.dart';

part 'dish_image_dto.freezed.dart';

part 'dish_image_dto.g.dart';

@freezed
abstract class DishImageDto implements _$DishImageDto {
  const factory DishImageDto({
    @required String id,
    @required String path,
  }) = _DishImageDto;

  factory DishImageDto.fromJson(Map<String, dynamic> json) => _$DishImageDtoFromJson(json);

  factory DishImageDto.fromDomain(DishImage dishImage) {
    return DishImageDto(
      id: dishImage.id.getOrCrash(),
      path: dishImage.path.getOrCrash(),
    );
  }

  factory DishImageDto.fromFirestore(DocumentSnapshot doc) {
    final data = Map.fromEntries([...doc.data().entries, MapEntry('id', doc.id)]);

    return DishImageDto.fromJson(data);
  }

  // ignore: unused_element
  const DishImageDto._();

  DishImage toDomain() {
    return DishImage(
      id: UniqueId.fromUniqueString(id),
      path: Image(path),
    );
  }
}
