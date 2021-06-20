import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish_image.dart';

part 'dish.freezed.dart';

@freezed
class Dish with _$Dish {
  static const galleryMaxLength = 3;

  const factory Dish({
    required UniqueId id,
    required String name,
    required String description,
    required String ingredients,
    required String allergens,
    required Money price,
    required bool visible,
    required LimitedList<DishImage> gallery,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Dish;
}
