import 'package:auto_route/auto_route_annotations.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/dishes_selection_screen.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/restaurant_selection_screen.dart';
import 'package:taberu/restaurant_menu/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: RestaurantSelectionScreen),
  MaterialRoute(page: DishesSelectionScreen),
])
class $Router {}
