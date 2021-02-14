import 'dart:convert';

import 'package:taberu/core/application/services/i_device_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/restaurant_dto.dart';

class SelectedRestaurantStorage {
  static const storageKey = 'selected_restaurant';

  final IDeviceStorage _deviceStorage;

  SelectedRestaurantStorage(this._deviceStorage);

  Restaurant getRestaurant() {
    final jsonRestaurant = jsonDecode(
      _deviceStorage.getString(storageKey),
    ) as Map<String, dynamic>;

    return RestaurantDto.fromJson(jsonRestaurant).toDomain();
  }

  Future<bool> setRestaurant(Restaurant restaurant) {
    return _deviceStorage.setString(
      storageKey,
      jsonEncode(RestaurantDto.fromDomain(restaurant).toJson()),
    );
  }
}
