import 'package:auto_route/auto_route_annotations.dart';
import 'package:taberu/core/presentation/splash/splash_screen.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreen, initial: true),
])
class $Router {}
