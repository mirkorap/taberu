import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/errors/unrecognized_configuration_error.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/configuration_type_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/delivery_costs_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/restaurant_tables_dto.dart';

class ConfigurationTypeDtoFactory {
  static ConfigurationTypeDto makeFromFirestore(DocumentSnapshot doc) {
    switch (doc.id) {
      case Configuration.deliveryCostsId:
        return DeliveryCostsDto.fromFirestore(doc);
      case Configuration.restaurantTablesId:
        return RestaurantTablesDto.fromFirestore(doc);
      default:
        throw UnrecognizedConfigurationError(doc.id);
    }
  }
}
