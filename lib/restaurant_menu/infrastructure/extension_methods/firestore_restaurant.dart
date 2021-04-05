import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
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
