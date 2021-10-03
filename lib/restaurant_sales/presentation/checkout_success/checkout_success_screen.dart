import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taberu/core/presentation/message_box/message_box_screen.dart';
import 'package:taberu/router.gr.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  const CheckoutSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageBoxScreen(
      onPressed: () => context.replaceRoute(const DishesSelectionRoute()),
      buttonText: tr('checkout_success.button_text'),
      icon: Icons.check_circle_outline,
      title: tr('checkout_success.title'),
      subtitle: tr('checkout_success.subtitle'),
    );
  }
}
