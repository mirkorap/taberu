import 'package:flutter/material.dart';

abstract class AppImage {
  static const logo = 'assets/images/logo.png';
  static const splashScreen = 'assets/images/restaurant_menu/splash_screen.jpg';
  static const dishPlaceholder = 'assets/images/restaurant_menu/dish_placeholder.jpg';

  static Future<List<void>> precacheImages(BuildContext context) {
    return Future.wait([
      precacheImage(const AssetImage(logo), context),
      precacheImage(const AssetImage(splashScreen), context),
      precacheImage(const AssetImage(dishPlaceholder), context),
    ]);
  }
}
