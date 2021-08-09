import 'package:freezed_annotation/freezed_annotation.dart';

part 'configuration_failure.freezed.dart';

@freezed
class ConfigurationFailure with _$ConfigurationFailure {
  const factory ConfigurationFailure.insufficientPermissions() = _InsufficientPermissions;

  const factory ConfigurationFailure.unexpected() = _Unexpected;
}
