import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/value_objects/day_of_week.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';

@immutable
class OpeningTime extends ValueObject {
  final Either<ValueFailure<DayOfWeek>, DayOfWeek> dayOfWeek;
  final Either<ValueFailure<DateTime>, DateTime> startTime;
  final Either<ValueFailure<DateTime>, DateTime> endTime;

  factory OpeningTime({
    required DayOfWeek dayOfWeek,
    required DateTime startTime,
    required DateTime endTime,
  }) {
    return OpeningTime._(
      dayOfWeek: right(dayOfWeek),
      startTime: right(startTime),
      endTime: right(endTime),
    );
  }

  OpeningTime._({
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  String get timeRange {
    if (startTime.andThen(endTime).isLeft()) {
      return '-';
    }

    final startTimeFormatted = startTime.getOrCrash().toString().substring(11, 16);
    final endTimeFormatted = endTime.getOrCrash().toString().substring(11, 16);

    return '$startTimeFormatted - $endTimeFormatted';
  }

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

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    final Either<ValueFailure<dynamic>, Unit> failureDayOfWeek = dayOfWeek.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failureStartTime = startTime.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failureEndTime = endTime.fold((l) => left(l), (_) => right(unit));

    return failureDayOfWeek.andThen(failureStartTime).andThen(failureEndTime).fold((l) => left(l), (r) => right(r));
  }
}
