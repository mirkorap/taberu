import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_color.dart';

class BottomNavigationBar extends StatelessWidget {
  // TODO: remove transition duration between routes
  static const routes = {
    DishesSelectionScreen.name: DishesSelectionScreen(),
    RestaurantContactsScreen.name: RestaurantContactsScreen(),
  };

  const BottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRouteName = ModalRoute.of(context)!.settings.name.toString();

    return CurvedNavigationBar(
      onTap: (index) async {
        await Future.delayed(StiloDuration.d500);
        context.router.replace(routes.values.elementAt(index));
      },
      backgroundColor: AppColor.primary,
      height: StiloHeight.h14,
      index: routes.keys.toList().indexOf(currentRouteName),
      items: [
        const Icon(Icons.home_outlined, size: 30.0),
        const Icon(Icons.shopping_cart_outlined, size: 30.0),
        //const Icon(Icons.add_shopping_cart_outlined, size: 30.0),
        //const Icon(Icons.restaurant_menu_outlined, size: 30.0),
      ],
    );
  }
}
