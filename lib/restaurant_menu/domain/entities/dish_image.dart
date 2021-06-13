import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/image.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';

part 'dish_image.freezed.dart';

@freezed
class DishImage with _$DishImage {
  const factory DishImage({
    required UniqueId id,
    required Image path,
  }) = _DishImage;
}
