import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';

@immutable
class Address extends ValueObject {
  static const postalCodeMaxLength = 5;

  final Either<ValueFailure<String>, String> city;
  final Either<ValueFailure<String>, String> postalCode;
  final Either<ValueFailure<String>, String> street;

  factory Address({
    required String city,
    required String postalCode,
    required String street,
  }) {
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
    required this.city,
    required this.postalCode,
    required this.street,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is Address && o.city == city && o.postalCode == postalCode && o.street == street;
  }

  @override
  int get hashCode => city.hashCode + postalCode.hashCode + street.hashCode;

  @override
  String toString() {
    if (city.andThen(postalCode).andThen(street).isLeft()) {
      return '-';
    }

    return '${street.getOrCrash()}, ${postalCode.getOrCrash()} ${city.getOrCrash()}';
  }
}
