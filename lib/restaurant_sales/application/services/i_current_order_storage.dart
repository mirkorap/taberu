import 'package:taberu/restaurant_sales/domain/entities/order.dart';

abstract class ICurrentOrderStorage {
  Order getOrder();

  Future<bool> setOrder(Order order);

  bool containsOrder();

  Future<bool> clear();
}
