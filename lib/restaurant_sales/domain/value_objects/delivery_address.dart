import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:taberu/core/domain/failures/value_failure.dart';
import 'package:taberu/core/domain/validators/value_validators.dart';
import 'package:taberu/core/domain/value_objects/value_object.dart';

@immutable
class DeliveryAddress extends ValueObject {
  static const postalCodeMaxLength = 5;

  final Either<ValueFailure<String>, String> city;
  final Either<ValueFailure<String>, String> postalCode;
  final Either<ValueFailure<String>, String> street;
  final Either<ValueFailure<String>, String> floor;
  final Either<ValueFailure<String>, String> firstName;
  final Either<ValueFailure<String>, String> lastName;
  final Either<ValueFailure<String>, String> phone;

  factory DeliveryAddress({
    required String city,
    required String postalCode,
    required String street,
    required String floor,
    required String firstName,
    required String lastName,
    required String phone,
  }) {
    final validatedCity = validateStringNotEmpty(city);
    final validatedPostalCode = validateStringNotEmpty(postalCode).flatMap(
      (value) => validateMaxStringLength(value, postalCodeMaxLength),
    );
    final validatedStreet = validateStringNotEmpty(street);
    final validatedFloor = validateStringNotEmpty(floor);
    final validatedFirstName = validateStringNotEmpty(firstName);
    final validatedLastName = validateStringNotEmpty(lastName);
    final validatedPhone = validatePhone(phone);

    return DeliveryAddress._(
      city: validatedCity,
      postalCode: validatedPostalCode,
      street: validatedStreet,
      floor: validatedFloor,
      firstName: validatedFirstName,
      lastName: validatedLastName,
      phone: validatedPhone,
    );
  }

  DeliveryAddress._({
    required this.city,
    required this.postalCode,
    required this.street,
    required this.floor,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is DeliveryAddress &&
        o.city == city &&
        o.postalCode == postalCode &&
        o.street == street &&
        o.floor == floor &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.phone == phone;
  }

  @override
  int get hashCode =>
      city.hashCode +
      postalCode.hashCode +
      street.hashCode +
      floor.hashCode +
      firstName.hashCode +
      lastName.hashCode +
      phone.hashCode;
}
