import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_firestore.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/failures/restaurant_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_restaurant_repository.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/restaurant_dto.dart';

@LazySingleton(as: IRestaurantRepository)
class RestaurantRepository implements IRestaurantRepository {
  final FirebaseFirestore _firestore;

  RestaurantRepository(this._firestore);

  @override
  Stream<Either<RestaurantFailure, KtList<Restaurant>>> searchByName(String name) async* {
    yield* _firestore.restaurants
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThanOrEqualTo: name)
        .orderBy('name')
        .snapshots()
        .map(
          (snapshot) => right<RestaurantFailure, KtList<Restaurant>>(
            snapshot.docs.map((doc) => RestaurantDto.fromFirestore(doc).toDomain()).toImmutableList(),
          ),
        )
        .onErrorReturnWith((e) {
      if (e is FirebaseException && e.isPermissionDeniedException) {
        return left(const RestaurantFailure.insufficientPermissions());
      }

      return left(const RestaurantFailure.unexpected());
    });
  }
}
