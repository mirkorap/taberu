import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class LimitedList<T> extends SimpleValueObject<KtList<T>> {
  @override
  final Either<ValueFailure<KtList<T>>, KtList<T>> value;
  final int maxLength;

  factory LimitedList(KtList<T> values, int maxLength) {
    return LimitedList._(
      validateMaxListLength(values, maxLength),
      maxLength,
    );
  }

  LimitedList._(this.value, this.maxLength);

  KtList<T> get getOrEmpty => value.getOrElse(() => emptyList());

  bool get isEmpty => getOrEmpty.isEmpty();

  bool get isNotEmpty => getOrEmpty.isNotEmpty();

  LimitedList<R> map<R>(R Function(T) transform) {
    final values = getOrEmpty.map(transform);

    return LimitedList(values, maxLength);
  }

  List<T> asList() => getOrEmpty.asList();
}
