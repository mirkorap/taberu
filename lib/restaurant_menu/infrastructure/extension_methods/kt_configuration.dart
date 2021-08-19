import 'package:kt_dart/collection.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';

extension KtConfiguration on KtIterable<Configuration> {
  Money get coverCharge {
    final configuration = first((configuration) => configuration.id.getOrCrash() == Configuration.coverChargeId);

    return configuration.value as Money;
  }

  Money get deliveryCosts {
    final configuration = first((configuration) => configuration.id.getOrCrash() == Configuration.deliveryCostsId);

    return configuration.value as Money;
  }

  KtList<RestaurantTable> get restaurantTables {
    final configuration = first((configuration) => configuration.id.getOrCrash() == Configuration.restaurantTablesId);

    return configuration.value as KtList<RestaurantTable>;
  }
}
