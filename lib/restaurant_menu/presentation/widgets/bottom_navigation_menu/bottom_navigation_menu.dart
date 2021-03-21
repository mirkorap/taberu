import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/bottom_navigation_menu/bottom_navigation_menu_item.dart';
import 'package:taberu/router.gr.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: StiloColor.transparent,
      elevation: StiloElevation.z0,
      child: Container(
        height: StiloHeight.h16,
        decoration: const BoxDecoration(
          color: StiloColor.white,
          boxShadow: StiloBoxShadow.lg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const BottomNavigationMenuItem(
              routeName: Routes.dishesSelectionScreen,
              activeIcon: Icons.home,
              inactiveIcon: Icons.home_outlined,
            ),
            const BottomNavigationMenuItem(
              routeName: null, // TODO: add routeName
              activeIcon: Icons.shopping_cart,
              inactiveIcon: Icons.shopping_cart_outlined,
            ),
            const BottomNavigationMenuItem(
              routeName: null, // TODO: add routeName
              activeIcon: Icons.add_shopping_cart,
              inactiveIcon: Icons.add_shopping_cart_outlined,
            ),
            const BottomNavigationMenuItem(
              routeName: null, // TODO: add routeName
              activeIcon: Icons.restaurant_menu,
              inactiveIcon: Icons.restaurant_menu_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
