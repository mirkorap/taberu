import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  }

  return left(ValueFailure.empty(input));
}

Either<ValueFailure<String>, String> validateMaxStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  }

  return left(ValueFailure.exceedingLength(input, maxLength));
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidEmail(input));
}

Either<ValueFailure<String>, String> validatePhone(String input) {
  const phoneRegex = r"""/\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/""";
  if (RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidPhone(input));
}

Either<ValueFailure<T>, T> validateChoice<T>(T input, KtList<T> choices) {
  if (choices.contains(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidChoice(input, choices));
}

Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(KtList<T> input, int maxLength) {
  if (input.size <= maxLength) {
    return right(input);
  }

  return left(ValueFailure.listTooLong(input, maxLength));
}
