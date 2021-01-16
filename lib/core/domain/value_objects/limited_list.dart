import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';

class LimitedList<T> {
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;

  factory LimitedList(KtList<T> values, int maxLength) {
    assert(values != null);

    return LimitedList._(
      validateMaxListLength(values, maxLength),
    );
  }

  LimitedList._(this.value);
}
