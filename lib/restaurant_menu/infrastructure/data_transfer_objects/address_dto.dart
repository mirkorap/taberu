import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/address.dart';

part 'address_dto.freezed.dart';

part 'address_dto.g.dart';

@freezed
abstract class AddressDto implements _$AddressDto {
  const factory AddressDto({
    @required String city,
    @required String postalCode,
    @required String street,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

  // ignore: unused_element
  const AddressDto._();

  Address toDomain() {
    return Address(
      city: city,
      postalCode: postalCode,
      street: street,
    );
  }
}
