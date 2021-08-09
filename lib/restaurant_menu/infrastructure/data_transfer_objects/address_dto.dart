import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/address.dart';

part 'address_dto.freezed.dart';

part 'address_dto.g.dart';

@freezed
class AddressDto with _$AddressDto {
  const factory AddressDto({
    required String city,
    required String postalCode,
    required String street,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

  factory AddressDto.fromDomain(Address address) {
    return AddressDto(
      city: address.city.getOrCrash(),
      postalCode: address.postalCode.getOrCrash(),
      street: address.street.getOrCrash(),
    );
  }

  const AddressDto._();

  Address toDomain() {
    return Address(
      city: city,
      postalCode: postalCode,
      street: street,
    );
  }
}
