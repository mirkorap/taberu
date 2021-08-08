import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart' hide Order;
import 'package:injectable/injectable.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/domain/failures/order_failure.dart';
import 'package:taberu/restaurant_sales/domain/repositories/i_order_repository.dart';
import 'package:taberu/restaurant_sales/infrastructure/data_transfer_objects/order.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepository implements IOrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository(this._firestore);

  @override
  Future<Either<OrderFailure, Order>> getLastRestaurantOrder(String restaurantId) async {
    try {
      final query = await _firestore
          .collection('restaurants')
          .doc(restaurantId)
          .collection('orders')
          .orderBy('created_at', descending: true)
          .limit(1)
          .get();

      if (query.docs.isNotEmpty) {
        return right(OrderDto.fromFirestore(query.docs[0]).toDomain());
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
      final restaurantDoc = _firestore.collection('restaurants').doc('');
      final orderDto = OrderDto.fromDomain(order);

      await restaurantDoc.collection('orders').doc(orderDto.id).set(orderDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.isPermissionDeniedException) {
        return left(const OrderFailure.insufficientPermissions());
      }

      return left(const OrderFailure.unexpected());
    }
  }

  @override
  Future<Either<OrderFailure, Unit>> update(Order order) async {
    try {
      final restaurantDoc = _firestore.collection('restaurants').doc('');
      final orderDto = OrderDto.fromDomain(order);

      await restaurantDoc.collection('orders').doc(orderDto.id).update(orderDto.toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      if (e.isPermissionDeniedException) {
        return left(const OrderFailure.insufficientPermissions());
      }

      if (e.isNotFoundException) {
        return left(const OrderFailure.unableToUpdate());
      }

      return left(const OrderFailure.unexpected());
    }
  }
}
