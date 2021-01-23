import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_image_dto.dart';

part 'dish_dto.freezed.dart';

part 'dish_dto.g.dart';

@freezed
abstract class DishDto implements _$DishDto {
  const factory DishDto({
    @required String id,
    @required String name,
    @required String description,
    @required String ingredients,
    @required String allergens,
    @required int price,
    @required bool visible,
    @required DishImageDto mainImage,
    @required List<DishImageDto> dishImages,
    @required String createdAt,
    @required String updatedAt,
  }) = _DishDto;

  factory DishDto.fromJson(Map<String, dynamic> json) => _$DishDtoFromJson(json);

  // ignore: unused_element
  const DishDto._();

  Dish toDomain() {
    final gallery = LimitedList(
      dishImages.map((item) => item.toDomain()).toImmutableList(),
      Dish.galleryMaxLength,
    );

    return Dish(
      id: UniqueId.fromUniqueString(id),
      name: name,
      description: description,
      ingredients: ingredients,
      allergens: allergens,
      price: Money(amount: price),
      visible: visible,
      mainImage: mainImage.toDomain(),
      gallery: gallery,
      createdAt: DateTime.tryParse(createdAt),
      updatedAt: DateTime.tryParse(updatedAt),
    );
  }
}
