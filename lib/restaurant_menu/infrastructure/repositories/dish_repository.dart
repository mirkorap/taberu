import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';
import 'package:taberu/restaurant_menu/domain/failures/dish_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_dish_repository.dart';
import 'package:taberu/restaurant_menu/domain/search_criteria/dish_search_criteria.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/dish_dto.dart';

@LazySingleton(as: IDishRepository)
class DishRepository implements IDishRepository {
  final FirebaseFirestore _firestore;

  DishRepository(this._firestore);

  @override
  Stream<Either<DishFailure, KtList<Dish>>> searchByMenu(DishSearchCriteria criteria) async* {
    assert(criteria.restaurantId != null);
    assert(criteria.menuId != null);

    yield* _firestore
        .collection('restaurants')
        .doc(criteria.restaurantId)
        .collection('menus')
        .doc(criteria.menuId)
        .collection('dishes')
        .where('visible', isEqualTo: true)
        .orderBy('name')
        .snapshots()
        .map((snapshot) => _fromDocsToDishes(snapshot.docs))
        .onErrorReturnWith(_fromExceptionToFailure);
  }

  @override
  Stream<Either<DishFailure, KtList<Dish>>> searchByName(DishSearchCriteria criteria) async* {
    assert(criteria.restaurantId != null);
    assert(criteria.name != null);

    yield* _firestore
        .collectionGroup('dishes')
        .where('name', isGreaterThanOrEqualTo: criteria.name)
        .where('name', isLessThanOrEqualTo: '${criteria.name}\uf8ff')
        .where('visible', isEqualTo: true)
        .snapshots()
        .map((snapshot) => _whereDocsHaveRestaurantId(snapshot.docs, criteria.restaurantId))
        .map(_fromDocsToDishes)
        .onErrorReturnWith(_fromExceptionToFailure);
  }

  List<QueryDocumentSnapshot> _whereDocsHaveRestaurantId(List<QueryDocumentSnapshot> docs, String restaurantId) {
    bool belongsToRestaurant(doc) => doc.reference.parent.parent.parent.parent.id == restaurantId;

    return docs.where(belongsToRestaurant).toList();
  }

  Either<DishFailure, KtList<Dish>> _fromDocsToDishes(List<QueryDocumentSnapshot> docs) {
    final dishes = docs.map((doc) => DishDto.fromFirestore(doc).toDomain()).toImmutableList();

    return right(dishes);
  }

  Either<DishFailure, KtList<Dish>> _fromExceptionToFailure(dynamic e) {
    if (e is FirebaseException && e.isPermissionDeniedException) {
      return left(const DishFailure.insufficientPermissions());
    }

    return left(const DishFailure.unexpected());
  }
}
