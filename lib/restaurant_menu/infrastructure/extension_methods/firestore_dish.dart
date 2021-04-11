import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/domain/failures/dish_failure.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_dto.dart';

extension DishQueryDocumentSnapshotList on List<QueryDocumentSnapshot> {
  List<QueryDocumentSnapshot> whereHaveRestaurantId(String restaurantId) {
    bool belongsToRestaurant(QueryDocumentSnapshot doc) {
      return doc.reference.parent.parent.parent.parent.id == restaurantId;
    }

    return where(belongsToRestaurant).toList();
  }

  List<QueryDocumentSnapshot> whereHaveName(String name) {
    bool containsName(QueryDocumentSnapshot doc) {
      return (doc.data()['name'] as String).toLowerCase().contains(name.toLowerCase());
    }

    return where(containsName).toList();
  }

  KtList<Dish> toDishList() {
    return map((doc) => doc.toDish()).toImmutableList();
  }
}

extension DishQueryDocumentSnapshot on QueryDocumentSnapshot {
  Dish toDish() {
    return DishDto.fromFirestore(this).toDomain();
  }
}

extension DishOnErrorExtensions on Stream<Either<DishFailure, KtList<Dish>>> {
  Stream<Either<DishFailure, KtList<Dish>>> onErrorReturnWithFailure() {
    return onErrorReturnWith((e) {
      if (e is FirebaseException && e.isPermissionDeniedException) {
        return left(const DishFailure.insufficientPermissions());
      }

      return left(const DishFailure.unexpected());
    });
  }
}
