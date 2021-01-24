import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/day_of_week.dart';
import 'package:taberu/core/infrastructure/json_converter/date_time_converter.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/opening_time.dart';

part 'opening_time_dto.freezed.dart';

part 'opening_time_dto.g.dart';

@freezed
abstract class OpeningTimeDto implements _$OpeningTimeDto {
  const factory OpeningTimeDto({
    @required String dayOfWeek,
    @required @DateTimeConverter() DateTime startTime,
    @required @DateTimeConverter() DateTime endTime,
  }) = _OpeningTimeDto;

  factory OpeningTimeDto.fromJson(Map<String, dynamic> json) => _$OpeningTimeDtoFromJson(json);

  // ignore: unused_element
  const OpeningTimeDto._();

  OpeningTime toDomain() {
    return OpeningTime(
      dayOfWeek: DayOfWeek.fromString(dayOfWeek),
      startTime: startTime,
      endTime: endTime,
    );
  }
}
