import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/day_of_week.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class OpeningTime extends ValueObject {
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

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is OpeningTime && o.dayOfWeek == dayOfWeek && o.startTime == startTime && o.endTime == endTime;
  }

  @override
  int get hashCode => dayOfWeek.hashCode + startTime.hashCode + endTime.hashCode;

  @override
  String toString() => 'OpeningTime($dayOfWeek, $startTime, $endTime)';
}
