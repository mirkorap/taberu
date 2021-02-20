import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class DayOfWeek extends SimpleValueObject<int> {
  static final daysOfWeek = {
    DateTime.monday: 'monday',
    DateTime.tuesday: 'tuesday',
    DateTime.wednesday: 'wednesday',
    DateTime.thursday: 'thursday',
    DateTime.friday: 'friday',
    DateTime.saturday: 'saturday',
    DateTime.sunday: 'sunday',
  }.toImmutableMap();

  @override
  final Either<ValueFailure<int>, int> value;

  factory DayOfWeek(int dayOfWeek) {
    assert(dayOfWeek != null);

    return DayOfWeek._(
      validateChoice(dayOfWeek, daysOfWeek.keys),
    );
  }

  factory DayOfWeek.fromString(String dayOfWeekStr) {
    final dayOfWeek = daysOfWeek.keys.firstOrNull(
      (k) => daysOfWeek[k] == dayOfWeekStr.toLowerCase(),
    );

    return DayOfWeek(dayOfWeek);
  }

  String asString() => daysOfWeek[getOrCrash()];

  DayOfWeek._(this.value);
}
