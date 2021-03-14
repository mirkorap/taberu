import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/domain/failures/dish_failure.dart';
import 'package:taberu/restaurant_menu/domain/search_criteria/dish_search_criteria.dart';

abstract class IDishRepository {
  Stream<Either<DishFailure, KtList<Dish>>> searchByMenu(DishSearchCriteria criteria);

  Stream<Either<DishFailure, KtList<Dish>>> searchByName(DishSearchCriteria criteria);
}
