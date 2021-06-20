import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/failures/restaurant_failure.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/restaurant_dto.dart';

extension RestaurantQueryDocumentSnapshotList on List<QueryDocumentSnapshot> {
  KtList<Restaurant> toRestaurantList() {
    return map((doc) => doc.toRestaurant()).toImmutableList();
  }
}

extension RestaurantQueryDocumentSnapshot on QueryDocumentSnapshot {
  Restaurant toRestaurant() {
    return RestaurantDto.fromFirestore(this).toDomain();
  }
}

extension RestaurantOnErrorExtensions on Stream<Either<RestaurantFailure, KtList<Restaurant>>> {
  Stream<Either<RestaurantFailure, KtList<Restaurant>>> onErrorReturnWithFailure() {
    return onErrorReturnWith((error, stackTrace) {
      if (error is FirebaseException && error.isPermissionDeniedException) {
        return left(const RestaurantFailure.insufficientPermissions());
      }

      return left(const RestaurantFailure.unexpected());
    });
  }
}
