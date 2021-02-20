import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/errors/unexpected_value_error.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';

extension EitherX<R> on Either<ValueFailure, R> {
  R getOrCrash() => fold((l) => throw UnexpectedValueError(l), (r) => r);
}
