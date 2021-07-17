import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/failures/configuration_failure.dart';
import 'package:taberu/restaurant_menu/domain/repositories/i_configuration_repository.dart';
import 'package:taberu/restaurant_menu/infrastructure/extension_methods/firestore_configuration.dart';

@LazySingleton(as: IConfigurationRepository)
class ConfigurationRepository implements IConfigurationRepository {
  final FirebaseFirestore _firestore;

  ConfigurationRepository(this._firestore);

  @override
  Stream<Either<ConfigurationFailure, KtList<Configuration>>> searchByRestaurant(String restaurantId) async* {
    yield* _firestore
        .collection('restaurants')
        .doc(restaurantId)
        .collection('configurations')
        .snapshots()
        .map((snapshot) => right<ConfigurationFailure, KtList<Configuration>>(snapshot.docs.toConfigurationList()))
        .onErrorReturnWithFailure();
  }
}
