import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/failures/configuration_failure.dart';

abstract class IConfigurationRepository {
  Stream<Either<ConfigurationFailure, KtList<Configuration>>> searchByRestaurant(String restaurantId);
}
