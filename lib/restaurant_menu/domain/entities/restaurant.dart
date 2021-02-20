import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/email_address.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/domain/value_objects/phone.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/address.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/opening_time.dart';

part 'restaurant.freezed.dart';

@freezed
abstract class Restaurant with _$Restaurant {
  static const weekOpeningTimeMaxLength = 7;

  const factory Restaurant({
    @required UniqueId id,
    @required String name,
    @required Address address,
    @required LimitedList<OpeningTime> weekOpeningTime,
    @required Phone phone,
    @required EmailAddress emailAddress,
    @required String websiteUrl,
    @required String facebookUrl,
    @required String instagramUrl,
    @required bool active,
    @required KtList<Menu> menus,
    @required DateTime createdAt,
    @required DateTime updatedAt,
  }) = _Restaurant;
}
