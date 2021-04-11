import 'package:auto_route/auto_route_annotations.dart';
import 'package:taberu/restaurant_menu/presentation/dish_details/dish_details_screen.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/dishes_selection_screen.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/restaurant_selection_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: RestaurantSelectionScreen),
    MaterialRoute(page: DishesSelectionScreen),
    MaterialRoute(page: DishDetailsScreen, fullscreenDialog: true),
  ],
  generateNavigationHelperExtension: true,
)
class $Router {}
