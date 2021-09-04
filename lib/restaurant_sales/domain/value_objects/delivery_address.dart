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
  final Either<ValueFailure<String>, String> firstName;
  final Either<ValueFailure<String>, String> lastName;
  final Either<ValueFailure<String>, String> phone;

  factory DeliveryAddress({
    String city = '',
    String postalCode = '',
    String street = '',
    String firstName = '',
    String lastName = '',
    String phone = '',
  }) {
    final validatedCity = validateStringNotEmpty(city);
    final validatedPostalCode = validateStringNotEmpty(postalCode).flatMap(
      (value) => validateMaxStringLength(value, postalCodeMaxLength),
    );
    final validatedStreet = validateStringNotEmpty(street);
    final validatedFirstName = validateStringNotEmpty(firstName);
    final validatedLastName = validateStringNotEmpty(lastName);
    final validatedPhone = validatePhone(phone);

    return DeliveryAddress._(
      city: validatedCity,
      postalCode: validatedPostalCode,
      street: validatedStreet,
      firstName: validatedFirstName,
      lastName: validatedLastName,
      phone: validatedPhone,
    );
  }

  DeliveryAddress._({
    required this.city,
    required this.postalCode,
    required this.street,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  DeliveryAddress copyWith({
    String? city,
    String? postalCode,
    String? street,
    String? firstName,
    String? lastName,
    String? phone,
  }) {
    final validatedCity = optionOf(city).fold(
      () => this.city,
      (e) => validateStringNotEmpty(e),
    );

    final validatedPostalCode = optionOf(postalCode).fold(
      () => this.postalCode,
      (e) => validateStringNotEmpty(e).flatMap(
        (value) => validateMaxStringLength(value, postalCodeMaxLength),
      ),
    );

    final validatedStreet = optionOf(street).fold(
      () => this.street,
      (e) => validateStringNotEmpty(e),
    );

    final validatedFirstName = optionOf(firstName).fold(
      () => this.firstName,
      (e) => validateStringNotEmpty(e),
    );

    final validatedLastName = optionOf(lastName).fold(
      () => this.lastName,
      (e) => validateStringNotEmpty(e),
    );

    final validatedPhone = optionOf(phone).fold(
      () => this.phone,
      (e) => validateStringNotEmpty(e),
    );

    return DeliveryAddress._(
      city: validatedCity,
      postalCode: validatedPostalCode,
      street: validatedStreet,
      firstName: validatedFirstName,
      lastName: validatedLastName,
      phone: validatedPhone,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is DeliveryAddress &&
        o.city == city &&
        o.postalCode == postalCode &&
        o.street == street &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.phone == phone;
  }

  @override
  int get hashCode =>
      city.hashCode + postalCode.hashCode + street.hashCode + firstName.hashCode + lastName.hashCode + phone.hashCode;

  @override
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    final Either<ValueFailure<dynamic>, Unit> failureCity = city.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failurePostalCode = postalCode.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failureStreet = street.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failureFirstName = firstName.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failureLastName = lastName.fold((l) => left(l), (_) => right(unit));
    final Either<ValueFailure<dynamic>, Unit> failurePhone = phone.fold((l) => left(l), (_) => right(unit));

    return failureCity
        .andThen(failurePostalCode)
        .andThen(failureStreet)
        .andThen(failureFirstName)
        .andThen(failureLastName)
        .andThen(failurePhone)
        .fold((l) => left(l), (r) => right(r));
  }
}
