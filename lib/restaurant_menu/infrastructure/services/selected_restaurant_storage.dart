import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:taberu/core/application/services/i_device_storage.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/restaurant_dto.dart';

@LazySingleton(as: ISelectedRestaurantStorage)
class SelectedRestaurantStorage implements ISelectedRestaurantStorage {
  final IDeviceStorage _deviceStorage;

  SelectedRestaurantStorage(this._deviceStorage);

  String get _storageKey => 'selected_restaurant';

  @override
  Restaurant getRestaurant() {
    final jsonRestaurant = jsonDecode(
      _deviceStorage.getString(_storageKey)!,
    ) as Map<String, dynamic>;

    return RestaurantDto.fromJson(jsonRestaurant).toDomain();
  }

  @override
  Future<bool> setRestaurant(Restaurant restaurant) {
    return _deviceStorage.setString(
      _storageKey,
      jsonEncode(RestaurantDto.fromDomain(restaurant).toJson()),
    );
  }

  @override
  bool containsRestaurant() {
    return _deviceStorage.containsKey(_storageKey);
  }
}
