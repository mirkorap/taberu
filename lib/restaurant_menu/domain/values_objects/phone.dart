import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';

class Phone {
  final Either<ValueFailure<String>, String> value;

  factory Phone(String input) {
    assert(input != null);

    return Phone._(validatePhone(input));
  }

  Phone._(this.value);
}
