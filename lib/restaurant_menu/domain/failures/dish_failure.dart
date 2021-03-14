import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_failure.freezed.dart';

@freezed
abstract class DishFailure with _$DishFailure {
  const factory DishFailure.insufficientPermissions() = _InsufficientPermissions;

  const factory DishFailure.unexpected() = _Unexpected;
}
