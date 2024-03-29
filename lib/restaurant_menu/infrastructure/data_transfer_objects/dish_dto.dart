import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_image_dto.dart';

part 'dish_dto.freezed.dart';

part 'dish_dto.g.dart';

@freezed
class DishDto with _$DishDto {
  const factory DishDto({
    required String id,
    required String name,
    required String description,
    required String ingredients,
    required String allergens,
    required int price,
    required bool visible,
    @JsonKey(defaultValue: []) @Default([]) List<DishImageDto> gallery,
    required int createdAt,
    required int updatedAt,
  }) = _DishDto;

  factory DishDto.fromJson(Map<String, dynamic> json) => _$DishDtoFromJson(json);

  factory DishDto.fromDomain(Dish dish) {
    return DishDto(
      id: dish.id.getOrCrash(),
      name: dish.name,
      description: dish.description,
      ingredients: dish.ingredients,
      allergens: dish.allergens,
      price: dish.price.amount.getOrCrash(),
      visible: dish.visible,
      gallery: dish.gallery.getOrCrash().map((dishImage) => DishImageDto.fromDomain(dishImage)).asList(),
      createdAt: dish.createdAt.millisecondsSinceEpoch,
      updatedAt: dish.updatedAt.millisecondsSinceEpoch,
    );
  }

  factory DishDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final json = Map.fromEntries([...data.entries, MapEntry('id', doc.id)]);

    return DishDto.fromJson(json);
  }

  const DishDto._();

  Dish toDomain() {
    return Dish(
      id: UniqueId.fromUniqueString(id),
      name: name,
      description: description,
      ingredients: ingredients,
      allergens: allergens,
      price: Money(amount: price),
      visible: visible,
      gallery: LimitedList(
        gallery.map((dishImage) => dishImage.toDomain()).toImmutableList(),
        Dish.galleryMaxLength,
      ),
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
