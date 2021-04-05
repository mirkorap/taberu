import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/failures/restaurant_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_restaurant_repository.dart';
import 'package:taberu/restaurant_menu/infrastructure/extension_methods/firestore_restaurant.dart';

@LazySingleton(as: IRestaurantRepository)
class RestaurantRepository implements IRestaurantRepository {
  final FirebaseFirestore _firestore;

  RestaurantRepository(this._firestore);

  @override
  Stream<Either<RestaurantFailure, KtList<Restaurant>>> searchByName(String name) async* {
    yield* _firestore
        .collection('restaurants')
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThanOrEqualTo: '$name\uf8ff')
        .where('active', isEqualTo: true)
        .orderBy('name')
        .snapshots()
        .map((snapshot) => right<RestaurantFailure, KtList<Restaurant>>(snapshot.docs.toRestaurantList()))
        .onErrorReturnWith(_fromExceptionToFailure);
  }

  Either<RestaurantFailure, KtList<Restaurant>> _fromExceptionToFailure(dynamic e) {
    if (e is FirebaseException && e.isPermissionDeniedException) {
      return left(const RestaurantFailure.insufficientPermissions());
    }

    return left(const RestaurantFailure.unexpected());
  }
}
