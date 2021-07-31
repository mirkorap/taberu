import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:taberu/core/application/services/i_device_storage.dart';
import 'package:taberu/restaurant_sales/application/services/i_current_order_storage.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';
import 'package:taberu/restaurant_sales/infrastructure/data_transfer_objects/order.dart';

@LazySingleton(as: ICurrentOrderStorage)
class CurrentOrderStorage implements ICurrentOrderStorage {
  static const storageKey = 'current_order';

  final IDeviceStorage _deviceStorage;

  CurrentOrderStorage(this._deviceStorage);

  @override
  Order getOrder() {
    final jsonOrder = jsonDecode(
      _deviceStorage.getString(storageKey)!,
    ) as Map<String, dynamic>;

    return OrderDto.fromJson(jsonOrder).toDomain();
  }

  @override
  Future<bool> setOrder(Order order) {
    return _deviceStorage.setString(
      storageKey,
      jsonEncode(OrderDto.fromDomain(order).toJson()),
    );
  }

  @override
  bool containsOrder() {
    return _deviceStorage.containsKey(storageKey);
  }
}
