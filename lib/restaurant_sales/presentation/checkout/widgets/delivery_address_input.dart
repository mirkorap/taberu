import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/domain/value_objects/delivery_address.dart';
import 'package:taberu/themes/app_input.dart';

typedef DeliveryAddressInputFailure = String? Function(DeliveryAddress deliveryAddress);

class DeliveryAddressInput extends HookWidget {
  final ValueChanged<String>? onChanged;
  final DeliveryAddressInputFailure onFailure;
  final IconData icon;
  final String hintText;

  const DeliveryAddressInput({
    Key? key,
    required this.onChanged,
    required this.onFailure,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: useTextEditingController(),
      onChanged: onChanged,
      validator: (_) {
        final cubit = context.read<CartCubit>();

        return optionOf(cubit.state.order.deliveryAddress).fold(
          () => null,
          (e) => onFailure(e),
        );
      },
      decoration: AppInput.inputTextField.copyWith(
        prefixIcon: Icon(icon),
        hintText: hintText,
      ),
    );
  }
}
