import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/domain/value_objects/quantity.dart';
import 'package:taberu/themes/app_button.dart';

class CartQuantity extends StatelessWidget {
  final VoidCallback onDecreasePressed;
  final VoidCallback onIncreasePressed;
  final Quantity quantity;

  const CartQuantity({
    Key? key,
    required this.onDecreasePressed,
    required this.onIncreasePressed,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: StiloWidth.w10,
          height: StiloHeight.h8,
          child: ElevatedButtonTheme(
            data: AppButton.decreaseButton,
            child: ElevatedButton(
              onPressed: onDecreasePressed,
              child: const Text('-', textAlign: TextAlign.center),
            ),
          ),
        ),
        SizedBox(
          width: StiloWidth.w14,
          height: StiloHeight.h8,
          child: IgnorePointer(
            child: ElevatedButtonTheme(
              data: AppButton.quantityButton,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  quantity.getOrCrash().toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: StiloWidth.w10,
          height: StiloHeight.h8,
          child: ElevatedButtonTheme(
            data: AppButton.increaseButton,
            child: ElevatedButton(
              onPressed: onIncreasePressed,
              child: const Text('+', textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }
}
