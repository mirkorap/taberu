import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/restaurant_menu/domain/values_objects/day_of_week.dart';

class OpeningTime {
  final Either<ValueFailure<DayOfWeek>, DayOfWeek> dayOfWeek;
  final Either<ValueFailure<DateTime>, DateTime> startTime;
  final Either<ValueFailure<DateTime>, DateTime> endTime;

  factory OpeningTime({
    @required DayOfWeek dayOfWeek,
    @required DateTime startTime,
    @required DateTime endTime,
  }) {
    assert(dayOfWeek != null);
    assert(startTime != null);
    assert(endTime != null);

    return OpeningTime._(
      dayOfWeek: right(dayOfWeek),
      startTime: right(startTime),
      endTime: right(endTime),
    );
  }

  OpeningTime._({
    @required this.dayOfWeek,
    @required this.startTime,
    @required this.endTime,
  });
}
