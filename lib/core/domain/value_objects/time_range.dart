import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';

class TimeRange {
  final Either<ValueFailure<DateTime>, DateTime> startTime;
  final Either<ValueFailure<DateTime>, DateTime> endTime;

  factory TimeRange({
    @required String startTime,
    @required String endTime,
  }) {
    assert(startTime != null);
    assert(endTime != null);

    return TimeRange._(
      startTime: right(DateTime.tryParse(startTime)),
      endTime: right(DateTime.tryParse(endTime)),
    );
  }

  factory TimeRange.fromString(String timeRange) {
    assert(timeRange != null);

    final timeRangeSplitted = timeRange.split(' - ');

    return TimeRange(
      startTime: timeRangeSplitted[0],
      endTime: timeRangeSplitted[1],
    );
  }

  TimeRange._({
    @required this.startTime,
    @required this.endTime,
  });
}
