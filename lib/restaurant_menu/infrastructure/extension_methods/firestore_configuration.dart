import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taberu/core/infrastructure/extension_methods/firebase_core.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/failures/configuration_failure.dart';
import 'package:taberu/restaurant_menu/infrastructure/factories/configuration_type_dto_factory.dart';

extension ConfigurationQueryDocumentSnapshotList on List<QueryDocumentSnapshot> {
  KtList<Configuration> toConfigurationList() {
    return map((doc) => doc.toConfiguration()).toImmutableList();
  }
}

extension ConfigurationQueryDocumentSnapshot on QueryDocumentSnapshot {
  Configuration toConfiguration() {
    return ConfigurationTypeDtoFactory.makeFromFirestore(this).toDomain();
  }
}

extension ConfigurationOnErrorExtensions on Stream<Either<ConfigurationFailure, KtList<Configuration>>> {
  Stream<Either<ConfigurationFailure, KtList<Configuration>>> onErrorReturnWithFailure() {
    return onErrorReturnWith((error, stackTrace) {
      if (error is FirebaseException && error.isPermissionDeniedException) {
        return left(const ConfigurationFailure.insufficientPermissions());
      }

      return left(const ConfigurationFailure.unexpected());
    });
  }
}
