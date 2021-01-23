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

part 'restaurant_dto.freezed.dart';

part 'restaurant_dto.g.dart';

@freezed
abstract class RestaurantDto implements _$RestaurantDto {
  const factory RestaurantDto({
    @required String id,
    @required String name,
    @required AddressDto address,
    @required List<OpeningTimeDto> openingTimes,
    @required String phone,
    @required String emailAddress,
    @required String websiteUrl,
    @required String facebookUrl,
    @required String instagramUrl,
    @required bool active,
    @required List<MenuDto> menus,
    @required String createdAt,
    @required String updatedAt,
  }) = _RestaurantDto;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) => _$RestaurantDtoFromJson(json);

  factory RestaurantDto.fromFirestore(DocumentSnapshot doc) {
    return RestaurantDto.fromJson(doc.data());
  }

  Restaurant toDomain() {
    final weekOpeningTime = LimitedList(
      openingTimes.map((item) => item.toDomain()).toImmutableList(),
      Restaurant.weekOpeningTimeMaxLength,
    );

    return Restaurant(
      id: UniqueId.fromUniqueString(id),
      name: name,
      address: address.toDomain(),
      weekOpeningTime: weekOpeningTime,
      phone: Phone(phone),
      emailAddress: EmailAddress(emailAddress),
      websiteUrl: websiteUrl,
      facebookUrl: facebookUrl,
      instagramUrl: instagramUrl,
      active: active,
      menus: menus.map((item) => item.toDomain()).toImmutableList(),
      createdAt: DateTime.tryParse(createdAt),
      updatedAt: DateTime.tryParse(updatedAt),
    );
  }
}
