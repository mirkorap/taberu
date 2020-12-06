import 'package:flutter/material.dart';
import 'package:taberu/restaurant_menu/screens/select_restaurant.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const SelectRestaurantScreen(),
};
