import 'package:dartz/dartz.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';

class EmailAddress {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String emailAddress) {
    assert(emailAddress != null);

    return EmailAddress._(validateEmailAddress(emailAddress));
  }

  EmailAddress._(this.value);
}
