import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
import 'package:taberu/restaurant_menu/domain/failures/menu_failure.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/menu_dto.dart';

extension MenuQueryDocumentSnapshotList on List<QueryDocumentSnapshot> {
  KtList<Menu> toMenuList() {
    return map((doc) => doc.toMenu()).toImmutableList();
  }
}

extension MenuQueryDocumentSnapshot on QueryDocumentSnapshot {
  Menu toMenu() {
    return MenuDto.fromFirestore(this).toDomain();
  }
}

extension MenuOnErrorExtensions on Stream<Either<MenuFailure, KtList<Menu>>> {
  Stream<Either<MenuFailure, KtList<Menu>>> onErrorReturnWithFailure() {
    return onErrorReturnWith((error, stackTrace) {
      if (error is FirebaseException && error.isPermissionDeniedException) {
        return left(const MenuFailure.insufficientPermissions());
      }

      return left(const MenuFailure.unexpected());
    });
  }
}
