import 'package:dartz/dartz.dart' hide Order;
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';

abstract class IOrderRepository {
  Future<Either<OrderFailure, Unit>> create(Order order);

  Future<Either<OrderFailure, Unit>> update(Order order);
}
