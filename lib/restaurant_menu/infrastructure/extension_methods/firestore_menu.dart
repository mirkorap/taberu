import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/menu.dart';
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
