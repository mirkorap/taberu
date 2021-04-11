import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_failure.freezed.dart';

@freezed
abstract class MenuFailure with _$MenuFailure {
  const factory MenuFailure.insufficientPermissions() = _InsufficientPermissions;

  const factory MenuFailure.unexpected() = _Unexpected;
}
