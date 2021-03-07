import 'package:flutter/material.dart';
import 'package:taberu/themes/app_tab_navigation.dart';

class RestaurantMenuTabs extends StatelessWidget {
  const RestaurantMenuTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        tabBarTheme: AppTabNavigation.restaurantMenuTabBar,
      ),
      child: const DefaultTabController(
        length: 6,
        child: TabBar(
          isScrollable: true,
          tabs: [
            Tab(text: 'Foods'),
            Tab(text: 'Snacks'),
            Tab(text: 'Drinks'),
            Tab(text: 'Bakery'),
            Tab(text: 'Beers'),
            Tab(text: 'Teas'),
          ],
        ),
      ),
    );
  }
}
