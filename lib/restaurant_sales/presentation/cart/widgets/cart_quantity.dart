import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_button.dart';

class CartQuantity extends StatelessWidget {
  const CartQuantity({Key? key}) : super(key: key);

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
              onPressed: () {},
              child: const Text('-', textAlign: TextAlign.center),
            ),
          ),
        ),
        SizedBox(
          width: StiloWidth.w10,
          height: StiloHeight.h8,
          child: IgnorePointer(
            child: ElevatedButtonTheme(
              data: AppButton.quantityButton,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('1', textAlign: TextAlign.center),
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
              onPressed: () {},
              child: const Text('+', textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }
}
