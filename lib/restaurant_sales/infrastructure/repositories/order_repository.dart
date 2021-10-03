import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';
import 'package:taberu/restaurant_sales/domain/repositories/i_order_repository.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/order_number.dart';
import 'package:taberu/restaurant_sales/infrastructure/data_transfer_objects/order_dto.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepository implements IOrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository(this._firestore);

  @override
  Future<Either<OrderFailure, OrderNumber>> fetchNextOrderNumber(String restaurantId) async {
    final lastOrderNumber = await fetchLastOrderNumber(restaurantId);

    return lastOrderNumber.fold(
      (f) => f.maybeWhen(
        noOrderFound: () => right(OrderNumber(1)),
        orElse: () => left(f),
      ),
      (orderNumber) => right(orderNumber.next()),
    );
  }

  @override
  Future<Either<OrderFailure, OrderNumber>> fetchLastOrderNumber(String restaurantId) async {
    try {
      final querySnapshot = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('orders')
          .orderBy('created_at', descending: true)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final orderDoc = querySnapshot.docs[0].data();

        return right(OrderNumber.fromString(orderDoc['number'] as String));
      }

      return left(const OrderFailure.noOrderFound());
    } on FirebaseException catch (e) {
      if (e.isPermissionDeniedException) {
        return left(const OrderFailure.insufficientPermissions());
      }

      return left(const OrderFailure.unexpected());
    }
  }

  @override
  Future<Either<OrderFailure, Unit>> create(Order order) async {
    try {
      final orderDto = OrderDto.fromDomain(order);

      await _firestore
          .collection('restaurants')
          .doc(orderDto.restaurant.id)
          .collection('orders')
          .doc(orderDto.id)
          .set(orderDto.toFirestore());

      orderDto.orderItems.forEach((orderItem) async {
        final dish = 'restaurants/${orderDto.restaurant.id}/menus/${orderItem.dish.menuId}/dishes/${orderItem.dish.id}';
        final data = {'dish': dish, ...orderItem.toFirestore()};

        await _firestore
            .collection('restaurants')
            .doc(orderDto.restaurant.id)
            .collection('orders')
            .doc(orderDto.id)
            .collection('order_items')
            .doc(orderItem.id)
            .set(data);
      });

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.isPermissionDeniedException) {
        return left(const OrderFailure.insufficientPermissions());
      }

      return left(const OrderFailure.unexpected());
    }
  }
}
