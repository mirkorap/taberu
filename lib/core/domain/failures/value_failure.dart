import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty(T failedValue) = Empty<T>;

  const factory ValueFailure.exceedingLength(T failedValue, int maxLength) = ExceedingLength<T>;

  const factory ValueFailure.invalidEmailAddress(T failedValue) = InvalidEmailAddress<T>;

  const factory ValueFailure.invalidPhone(T failedValue) = InvalidPhone<T>;

  const factory ValueFailure.invalidChoice(T failedValue, KtSet<T> choices) = InvalidChoice<T>;

  const factory ValueFailure.listTooLong(T failedValue, int maxLength) = ListTooLong<T>;

  const factory ValueFailure.invalidImageFormat(T failedValue) = InvalidImageFormat<T>;
}
