import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';

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
  const emailAddressRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailAddressRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidEmailAddress(input));
}

Either<ValueFailure<String>, String> validatePhone(String input) {
  const phoneRegex = r"""^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$""";
  if (RegExp(phoneRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidPhone(input));
}

Either<ValueFailure<T>, T> validateChoice<T>(T input, KtSet<T> choices) {
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

Either<ValueFailure<String>, String> validateImageFormat(String input) {
  const imageFormatRegex = r"""/\.(gif|jpe?g|tiff?|png|webp|bmp)$/""";
  if (RegExp(imageFormatRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidImageFormat(input));
}
