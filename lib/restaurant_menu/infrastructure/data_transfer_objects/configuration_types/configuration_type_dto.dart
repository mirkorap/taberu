import 'package:taberu/restaurant_menu/domain/entities/configuration.dart';

abstract class ConfigurationTypeDto<T> {
  Configuration<T> toDomain();
}
