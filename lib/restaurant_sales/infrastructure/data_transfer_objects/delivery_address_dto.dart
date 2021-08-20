import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/delivery_address.dart';

part 'delivery_address_dto.freezed.dart';

part 'delivery_address_dto.g.dart';

@freezed
class DeliveryAddressDto with _$DeliveryAddressDto {
  const factory DeliveryAddressDto({
    required String city,
    required String postalCode,
    required String street,
    required String firstName,
    required String lastName,
    required String phone,
  }) = _DeliveryAddressDto;

  factory DeliveryAddressDto.fromJson(Map<String, dynamic> json) => _$DeliveryAddressDtoFromJson(json);

  factory DeliveryAddressDto.fromDomain(DeliveryAddress deliveryAddress) {
    return DeliveryAddressDto(
      city: deliveryAddress.city.getOrCrash(),
      postalCode: deliveryAddress.postalCode.getOrCrash(),
      street: deliveryAddress.street.getOrCrash(),
      firstName: deliveryAddress.firstName.getOrCrash(),
      lastName: deliveryAddress.lastName.getOrCrash(),
      phone: deliveryAddress.phone.getOrCrash(),
    );
  }

  const DeliveryAddressDto._();

  DeliveryAddress toDomain() {
    return DeliveryAddress(
      city: city,
      postalCode: postalCode,
      street: street,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
  }
}
