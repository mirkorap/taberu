import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen(context);

    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AppImage.splashScreen,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 150.0),
            child: const CircularProgressIndicator(
              valueColor: AppColor.circularProgressIndicator,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToNextScreen(BuildContext context) async {
    await Future.delayed(StiloDuration.d3000);

    final storage = getIt<ISelectedRestaurantStorage>();
    if (storage.containsRestaurant()) {
      await ExtendedNavigator.of(context).replace(Routes.dishesSelectionScreen);
    }

    await ExtendedNavigator.of(context).replace(Routes.restaurantSelectionScreen);
  }
}
