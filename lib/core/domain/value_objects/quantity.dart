import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class Quantity extends SimpleValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory Quantity(int quantity) {
    return Quantity._(validateGreaterOrEqualThan(quantity, 0));
  }

  Quantity._(this.value);
}