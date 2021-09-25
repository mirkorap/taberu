import 'package:dartz/dartz.dart' hide Order;
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/order_number.dart';

abstract class IOrderRepository {
  Future<Either<OrderFailure, OrderNumber>> fetchNextOrderNumber(String restaurantId);

  Future<Either<OrderFailure, OrderNumber>> fetchLastOrderNumber(String restaurantId);

  Future<Either<OrderFailure, Unit>> create(Order order);
}
