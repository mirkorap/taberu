import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';

@immutable
abstract class ValueObject {
  @override
  bool operator ==(Object o) => throw UnimplementedError();

  @override
  int get hashCode => throw UnimplementedError();

  @override
  String toString() => throw UnimplementedError();

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit => throw UnimplementedError();
}

@immutable
abstract class SimpleValueObject<T> extends ValueObject {
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() => value.getOrCrash();

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

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((l) => left(l), (_) => right(unit));
  }
}
