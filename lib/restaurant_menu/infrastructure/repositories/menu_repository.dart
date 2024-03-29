import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/domain/failures/menu_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_menu_repository.dart';
import 'package:taberu/restaurant_menu/infrastructure/extension_methods/firestore_menu.dart';

@LazySingleton(as: IMenuRepository)
class MenuRepository implements IMenuRepository {
  final FirebaseFirestore _firestore;

  MenuRepository(this._firestore);

  @override
  Stream<Either<MenuFailure, KtList<Menu>>> searchByRestaurant(String restaurantId) async* {
    yield* _firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('menus')
        .orderBy('name')
        .snapshots()
        .map((snapshot) => right<MenuFailure, KtList<Menu>>(snapshot.docs.toMenuList()))
        .onErrorReturnWithFailure();
  }
}
