import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/time_range.dart';
import 'package:taberu/restaurant_menu/domain/values_objects/day_of_week.dart';

class OpeningTime {
  final Either<ValueFailure<DayOfWeek>, DayOfWeek> dayOfWeek;
  final Either<ValueFailure<TimeRange>, TimeRange> openingTime;

  factory OpeningTime({
    @required DayOfWeek dayOfWeek,
    @required TimeRange openingTime,
  }) {
    assert(dayOfWeek != null);
    assert(openingTime != null);

    return OpeningTime._(
      dayOfWeek: right(dayOfWeek),
      openingTime: right(openingTime),
    );
  }

  OpeningTime._({
    @required this.dayOfWeek,
    @required this.openingTime,
  });
}
