import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/domain/value_objects/day_of_week.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/opening_time.dart';

part 'opening_time_dto.freezed.dart';

part 'opening_time_dto.g.dart';

@freezed
class OpeningTimeDto with _$OpeningTimeDto {
  const factory OpeningTimeDto({
    required String dayOfWeek,
    required int startTime,
    required int endTime,
  }) = _OpeningTimeDto;

  factory OpeningTimeDto.fromJson(Map<String, dynamic> json) => _$OpeningTimeDtoFromJson(json);

  factory OpeningTimeDto.fromDomain(OpeningTime openingTime) {
    return OpeningTimeDto(
      dayOfWeek: openingTime.dayOfWeek.getOrCrash().asString(),
      startTime: openingTime.startTime.getOrCrash().millisecondsSinceEpoch,
      endTime: openingTime.endTime.getOrCrash().millisecondsSinceEpoch,
    );
  }

  // ignore: unused_element
  const OpeningTimeDto._();

  OpeningTime toDomain() {
    return OpeningTime(
      dayOfWeek: DayOfWeek.fromString(dayOfWeek),
      startTime: DateTime.fromMillisecondsSinceEpoch(startTime),
      endTime: DateTime.fromMillisecondsSinceEpoch(endTime),
    );
  }
}
