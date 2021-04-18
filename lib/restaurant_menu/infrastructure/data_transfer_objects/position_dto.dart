import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/position.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';

part 'position_dto.freezed.dart';

part 'position_dto.g.dart';

@freezed
abstract class PositionDto implements _$PositionDto {
  const factory PositionDto({
    @required int longitude,
    @required int latitude,
  }) = _PositionDto;

  factory PositionDto.fromJson(Map<String, dynamic> json) => _$PositionDtoFromJson(json);

  factory PositionDto.fromDomain(Position position) {
    return PositionDto(
      longitude: position.longitude.getOrCrash(),
      latitude: position.latitude.getOrCrash(),
    );
  }

  // ignore: unused_element
  const PositionDto._();

  Position toDomain() {
    return Position(
      longitude: longitude,
      latitude: latitude,
    );
  }
}
