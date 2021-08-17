import 'package:flutter/material.dart';

abstract class AppImage {
  static const logo = 'assets/images/logo.png';
  static const splashScreen = 'assets/images/restaurant_menu/splash_screen.jpg';
  static const dishPlaceholder = 'assets/images/restaurant_menu/dish_placeholder.jpg';
  static const restaurantMarker = 'assets/images/restaurant_menu/restaurant_marker.png';
  static const swipeIcon = 'assets/images/restaurant_sales/swipe_icon.png';

  static Future<List<void>> precacheImages(BuildContext context) {
    return Future.wait([
      precacheImage(const AssetImage(logo), context),
      precacheImage(const AssetImage(splashScreen), context),
      precacheImage(const AssetImage(dishPlaceholder), context),
      precacheImage(const AssetImage(restaurantMarker), context),
      precacheImage(const AssetImage(swipeIcon), context),
    ]);
  }
}
