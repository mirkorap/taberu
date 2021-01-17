import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/day_of_week.dart';
import 'package:taberu/core/domain/value_objects/time_range.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/opening_time.dart';

part 'opening_time_dto.freezed.dart';

part 'opening_time_dto.g.dart';

@freezed
abstract class OpeningTimeDto implements _$OpeningTimeDto {
  const factory OpeningTimeDto({
    @required String dayOfWeek,
    @required String openingTime,
  }) = _OpeningTimeDto;

  factory OpeningTimeDto.fromJson(Map<String, dynamic> json) => _$OpeningTimeDtoFromJson(json);

  OpeningTime toDomain() {
    return OpeningTime(
      dayOfWeek: DayOfWeek.fromString(dayOfWeek),
      openingTime: TimeRange.fromString(openingTime),
    );
  }
}
