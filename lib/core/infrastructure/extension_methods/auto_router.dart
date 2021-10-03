import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

extension AutoRouterX on BuildContext {
  Future<void> replaceAll(List<PageRouteInfo> routes) => router.replaceAll(routes);
}
