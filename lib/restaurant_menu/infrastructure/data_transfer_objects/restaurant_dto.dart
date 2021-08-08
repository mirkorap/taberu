import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/email_address.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/domain/value_objects/phone.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/address_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/menu_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/opening_time_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/position_dto.dart';

part 'restaurant_dto.freezed.dart';

part 'restaurant_dto.g.dart';

@freezed
class RestaurantDto with _$RestaurantDto {
  const factory RestaurantDto({
    required String id,
    required String name,
    required AddressDto address,
    required PositionDto position,
    required List<OpeningTimeDto> weekOpeningTime,
    required String phone,
    required String emailAddress,
    required String websiteUrl,
    required String facebookUrl,
    required String instagramUrl,
    required bool active,
    @JsonKey(defaultValue: []) @Default([]) List<MenuDto> menus,
    required int createdAt,
    required int updatedAt,
  }) = _RestaurantDto;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) => _$RestaurantDtoFromJson(json);

  factory RestaurantDto.fromDomain(Restaurant restaurant) {
    return RestaurantDto(
      id: restaurant.id.getOrCrash(),
      name: restaurant.name,
      address: AddressDto.fromDomain(restaurant.address),
      position: PositionDto.fromDomain(restaurant.position),
      weekOpeningTime: restaurant.weekOpeningTime.map((openingTime) => OpeningTimeDto.fromDomain(openingTime)).asList(),
      phone: restaurant.phone.getOrCrash(),
      emailAddress: restaurant.emailAddress.getOrCrash(),
      websiteUrl: restaurant.websiteUrl,
      facebookUrl: restaurant.facebookUrl,
      instagramUrl: restaurant.instagramUrl,
      active: restaurant.active,
      menus: restaurant.menus.map((menu) => MenuDto.fromDomain(menu)).asList(),
      createdAt: restaurant.createdAt.millisecondsSinceEpoch,
      updatedAt: restaurant.updatedAt.millisecondsSinceEpoch,
    );
  }

  factory RestaurantDto.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    final json = Map.fromEntries([...data.entries, MapEntry('id', doc.id)]);

    return RestaurantDto.fromJson(json);
  }

  const RestaurantDto._();

  Restaurant toDomain() {
    return Restaurant(
      id: UniqueId.fromUniqueString(id),
      name: name,
      address: address.toDomain(),
      position: position.toDomain(),
      weekOpeningTime: LimitedList(
        weekOpeningTime.map((item) => item.toDomain()).toImmutableList(),
        Restaurant.weekOpeningTimeMaxLength,
      ),
      phone: Phone(phone),
      emailAddress: EmailAddress(emailAddress),
      websiteUrl: websiteUrl,
      facebookUrl: facebookUrl,
      instagramUrl: instagramUrl,
      active: active,
      menus: menus.map((item) => item.toDomain()).toImmutableList(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
    );
  }
}
