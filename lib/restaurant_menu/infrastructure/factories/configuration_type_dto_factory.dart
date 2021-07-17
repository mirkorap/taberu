import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';
import 'package:taberu/restaurant_menu/domain/errors/unrecognized_configuration_error.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/configuration_type_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/cover_charge_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/delivery_costs_dto.dart';
import 'package:taberu/restaurant_menu/infrastructure/data_transfer_objects/configuration_types/restaurant_tables_dto.dart';

class ConfigurationTypeDtoFactory {
  static ConfigurationTypeDto makeFromDomain(Configuration configuration) {
    switch (configuration.id.getOrCrash()) {
      case Configuration.coverChargeId:
        return CoverChargeDto.fromDomain(configuration as Configuration<Money>);
      case Configuration.deliveryCostsId:
        return DeliveryCostsDto.fromDomain(configuration as Configuration<Money>);
      case Configuration.restaurantTablesId:
        return RestaurantTablesDto.fromDomain(configuration as Configuration<KtList<RestaurantTable>>);
      default:
        throw UnrecognizedConfigurationError(configuration.id.getOrCrash());
    }
  }

  static ConfigurationTypeDto makeFromFirestore(DocumentSnapshot doc) {
    switch (doc.id) {
      case Configuration.coverChargeId:
        return CoverChargeDto.fromFirestore(doc);
      case Configuration.deliveryCostsId:
        return DeliveryCostsDto.fromFirestore(doc);
      case Configuration.restaurantTablesId:
        return RestaurantTablesDto.fromFirestore(doc);
      default:
        throw UnrecognizedConfigurationError(doc.id);
    }
  }
}
