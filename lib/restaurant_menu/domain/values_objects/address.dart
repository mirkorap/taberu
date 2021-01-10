import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/value_objects/value_failure.dart';
import 'package:taberu/core/domain/value_objects/value_validators.dart';

class Address {
  static const postalCodeMaxLength = 5;

  final Either<ValueFailure<String>, String> city;
  final Either<ValueFailure<String>, String> postalCode;
  final Either<ValueFailure<String>, String> street;

  factory Address({
    @required String cityInput,
    @required String postalCodeInput,
    @required String streetInput,
  }) {
    assert(cityInput != null);
    assert(postalCodeInput != null);
    assert(streetInput != null);

    final city = validateStringNotEmpty(cityInput);
    final postalCode = validateStringNotEmpty(postalCodeInput).flatMap(
      (value) => validateMaxStringLength(value, postalCodeMaxLength),
    );
    final street = validateStringNotEmpty(streetInput);

    return Address._(
      city: city,
      postalCode: postalCode,
      street: street,
    );
  }

  Address._({
    @required this.city,
    @required this.postalCode,
    @required this.street,
  });
}
