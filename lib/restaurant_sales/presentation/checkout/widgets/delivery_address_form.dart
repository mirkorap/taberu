import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/delivery_address_form_input.dart';

class DeliveryAddressForm extends StatelessWidget {
  const DeliveryAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'checkout.delivery_address',
            style: Theme.of(context).textTheme.headline2,
          ).tr(),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryCity(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.city.fold(
              (l) => l.maybeMap(
                empty: (_) => tr('app.failures.empty'),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.location_city,
            hintText: tr('checkout.delivery_city'),
          ),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryPostalCode(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.postalCode.fold(
              (l) => l.maybeMap(
                empty: (_) => tr('app.failures.empty'),
                exceedingLength: (f) => tr('app.failures.exceeding_length', args: [f.maxLength.toString()]),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.location_city,
            hintText: tr('checkout.delivery_postal_code'),
          ),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryStreet(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.street.fold(
              (l) => l.maybeMap(
                empty: (_) => tr('app.failures.empty'),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.location_city,
            hintText: tr('checkout.delivery_street'),
          ),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryFirstName(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.firstName.fold(
              (l) => l.maybeMap(
                empty: (_) => tr('app.failures.empty'),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.person,
            hintText: tr('checkout.delivery_first_name'),
          ),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryLastName(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.lastName.fold(
              (l) => l.maybeMap(
                empty: (_) => tr('app.failures.empty'),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.person,
            hintText: tr('checkout.delivery_last_name'),
          ),
          StiloSpacing.vert4,
          DeliveryAddressFormInput(
            onChanged: (value) {
              final cubit = context.read<CartCubit>();
              cubit.updateDeliveryPhone(value);
            },
            onFailure: (deliveryAddress) => deliveryAddress.phone.fold(
              (l) => l.maybeMap(
                invalidPhone: (_) => tr('app.failures.invalid_phone'),
                orElse: () => null,
              ),
              (_) => null,
            ),
            icon: Icons.phone,
            hintText: tr('checkout.delivery_phone'),
          ),
        ],
      ),
    );
  }
}
