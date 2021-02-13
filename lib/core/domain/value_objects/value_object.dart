import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/errors/unexpected_value_error.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';

@immutable
abstract class ValueObject {
  @override
  bool operator ==(Object o) => throw UnimplementedError();

  @override
  int get hashCode => throw UnimplementedError();

  @override
  String toString() => throw UnimplementedError();
}

@immutable
abstract class SimpleValueObject<T> extends ValueObject {
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold((l) => throw UnexpectedValueError(l), (r) => r);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is SimpleValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => '$runtimeType($value)';
}
