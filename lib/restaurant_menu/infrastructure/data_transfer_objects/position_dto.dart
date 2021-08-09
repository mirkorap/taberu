import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/position.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';

part 'position_dto.freezed.dart';

part 'position_dto.g.dart';

@freezed
class PositionDto with _$PositionDto {
  const factory PositionDto({
    required double longitude,
    required double latitude,
  }) = _PositionDto;

  factory PositionDto.fromJson(Map<String, dynamic> json) => _$PositionDtoFromJson(json);

  factory PositionDto.fromDomain(Position position) {
    return PositionDto(
      longitude: position.longitude.getOrCrash(),
      latitude: position.latitude.getOrCrash(),
    );
  }

  const PositionDto._();

  Position toDomain() {
    return Position(
      longitude: longitude,
      latitude: latitude,
    );
  }
}
