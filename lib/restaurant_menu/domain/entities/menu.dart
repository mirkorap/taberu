import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/uuid.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

part 'menu.freezed.dart';

@freezed
abstract class Menu with _$Menu {
  const factory Menu({
    @required UniqueId id,
    @required String name,
    @required KtList<Dish> dishes,
  }) = _Menu;
}
