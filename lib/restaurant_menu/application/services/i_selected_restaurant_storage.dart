import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';

abstract class ISelectedRestaurantStorage {
  Restaurant getRestaurant();

  Future<bool> setRestaurant(Restaurant restaurant);
}
