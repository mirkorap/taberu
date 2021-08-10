import 'package:auto_route/auto_route.dart';
import 'package:taberu/core/presentation/message_box/message_box_screen.dart';
import 'package:taberu/core/presentation/splash/splash_screen.dart';
import 'package:taberu/restaurant_menu/presentation/dish_details/dish_details_screen.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/dishes_selection_screen.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_contacts/restaurant_contacts_screen.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/restaurant_selection_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen),
    AutoRoute(page: MessageBoxScreen),
    AutoRoute(page: RestaurantSelectionScreen),
    AutoRoute(page: DishesSelectionScreen),
    AutoRoute(page: RestaurantContactsScreen),
    AutoRoute(page: DishDetailsScreen, fullscreenDialog: true),
  ],
)
class $AppRouter {}
