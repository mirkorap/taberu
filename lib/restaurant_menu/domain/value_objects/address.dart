import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';

class Address {
  static const postalCodeMaxLength = 5;

  final Either<ValueFailure<String>, String> city;
  final Either<ValueFailure<String>, String> postalCode;
  final Either<ValueFailure<String>, String> street;

  factory Address({
    @required String city,
    @required String postalCode,
    @required String street,
  }) {
    assert(city != null);
    assert(postalCode != null);
    assert(street != null);

    final validatedCity = validateStringNotEmpty(city);
    final validatedPostalCode = validateStringNotEmpty(postalCode).flatMap(
      (value) => validateMaxStringLength(value, postalCodeMaxLength),
    );
    final validatedStreet = validateStringNotEmpty(street);

    return Address._(
      city: validatedCity,
      postalCode: validatedPostalCode,
      street: validatedStreet,
    );
  }

  Address._({
    @required this.city,
    @required this.postalCode,
    @required this.street,
  });
}
