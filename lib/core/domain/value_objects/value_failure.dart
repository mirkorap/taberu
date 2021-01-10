import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty(T failedValue) = Empty<T>;

  const factory ValueFailure.exceedingLength(T failedValue, int maxLength) = ExceedingLength<T>;

  const factory ValueFailure.invalidEmail(T failedValue) = InvalidEmail<T>;

  const factory ValueFailure.invalidPhone(T failedValue) = InvalidPhone<T>;

  const factory ValueFailure.invalidChoice(T failedValue, KtList<T> choices) = InvalidChoice<T>;

  const factory ValueFailure.listTooLong(T failedValue, int maxLength) = ListTooLong<T>;
}
