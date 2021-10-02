import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/themes/app_color.dart';

class ConfirmOrderButton extends StatelessWidget {
  const ConfirmOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state.isSaving,
          child: Padding(
            padding: StiloEdge.all6,
            child: ElevatedButton(
              onPressed: () {
                final cubit = context.read<CartCubit>();
                cubit.saveOrder();
              },
              child: option(state.isSaving, unit).fold(
                () => const Text('checkout.confirm_order').tr(),
                (_) => const CircularProgressIndicator(
                  valueColor: AppColor.actionProgressIndicator,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
