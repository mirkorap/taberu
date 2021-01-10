import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';

class DayOfWeek {
  static const daysOfWeek = {
    DateTime.monday: 'monday',
    DateTime.tuesday: 'tuesday',
    DateTime.wednesday: 'wednesday',
    DateTime.thursday: 'thursday',
    DateTime.friday: 'friday',
    DateTime.saturday: 'saturday',
    DateTime.sunday: 'sunday',
  };

  final Either<ValueFailure<int>, int> value;

  factory DayOfWeek(int dayOfWeek) {
    assert(dayOfWeek != null);

    return DayOfWeek._(
      validateChoice(dayOfWeek, daysOfWeek.keys.toImmutableList()),
    );
  }

  factory DayOfWeek.fromString(String dayOfWeekStr) {
    final dayOfWeek = daysOfWeek.keys.firstWhere(
      (k) => daysOfWeek[k] == dayOfWeekStr,
      orElse: () => null,
    );

    return DayOfWeek(dayOfWeek);
  }

  DayOfWeek._(this.value);
}
