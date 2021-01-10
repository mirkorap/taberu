import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';
import 'package:taberu/restaurant_menu/domain/values_objects/opening_time.dart';

class WeekOpeningTime {
  static const maxLength = 7;

  final Either<ValueFailure<KtList<OpeningTime>>, KtList<OpeningTime>> value;

  factory WeekOpeningTime(KtList<OpeningTime> input) {
    assert(input != null);

    return WeekOpeningTime._(validateMaxListLength(input, maxLength));
  }

  WeekOpeningTime._(this.value);
}
