import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/domain/failures/menu_failure.dart';

abstract class IMenuRepository {
  Stream<Either<MenuFailure, KtList<Menu>>> searchByRestaurant(String restaurantId);
}
