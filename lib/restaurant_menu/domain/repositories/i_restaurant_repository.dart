import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/domain/failures/restaurant_failure.dart';

abstract class IRestaurantRepository {
  Stream<Either<RestaurantFailure, KtList<Restaurant>>> searchByName(String name);
}
