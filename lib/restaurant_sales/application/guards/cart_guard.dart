import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:taberu/restaurant_sales/application/services/i_current_order_storage.dart';
import 'package:taberu/router.gr.dart';

@injectable
class CartGuard extends AutoRouteGuard {
  final ICurrentOrderStorage _currentOrderStorage;

  CartGuard(this._currentOrderStorage);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (canNavigate()) {
      return resolver.next();
    }

    router.replace(const EmptyCartScreen());
  }

  bool canNavigate() {
    return _currentOrderStorage.containsOrderItems();
  }
}
