import 'package:auto_route/auto_route.dart';
import 'package:taberu/router.gr.dart';

class CartGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // TODO: replace with ICurrentOrderStorage or CartCubit
    const containsOrder = true;

    if (containsOrder) {
      return resolver.next();
    }

    router.replace(const EmptyCartScreen());
  }
}
