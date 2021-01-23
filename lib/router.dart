import 'package:auto_route/auto_route_annotations.dart';
import 'package:taberu/core/presentation/splash/splash_screen.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_selection/restaurant_selection_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: RestaurantSelectionScreen),
])
class $Router {}
