import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_color.dart';

class BottomNavigationMenu extends StatelessWidget {
  static const routes = [
    Routes.dishesSelectionScreen,
    Routes.dishesSelectionScreen,
    Routes.dishesSelectionScreen,
    Routes.dishesSelectionScreen,
  ];

  const BottomNavigationMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: AppColor.primary,
      height: 55.0,
      items: [
        const Icon(Icons.home_outlined, size: 30.0),
        const Icon(Icons.shopping_cart_outlined, size: 30.0),
        const Icon(Icons.add_shopping_cart_outlined, size: 30.0),
        const Icon(Icons.restaurant_menu_outlined, size: 30.0),
      ],
      onTap: (index) {
        final isCurrentRoute = ModalRoute.of(context).settings.name == routes[index];
        if (!isCurrentRoute) {
          ExtendedNavigator.of(context).replace(routes[index]);
        }
      },
    );
  }
}
