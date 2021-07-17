import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';

part 'configuration.freezed.dart';

@freezed
class Configuration<T> with _$Configuration<T> {
  static const coverChargeId = 'cover_charge';
  static const deliveryCostsId = 'delivery_costs';
  static const restaurantTablesId = 'restaurant_tables';

  const factory Configuration({
    required UniqueId id,
    required T value,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Configuration;
}
