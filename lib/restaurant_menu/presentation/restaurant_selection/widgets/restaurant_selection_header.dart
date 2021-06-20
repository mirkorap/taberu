import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_image.dart';

class RestaurantSelectionHeader extends StatelessWidget {
  const RestaurantSelectionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: StiloColor.white,
        borderRadius: StiloBorderRadius.bottomXl6,
      ),
      child: Image.asset(AppImage.logo),
    );
  }
}
