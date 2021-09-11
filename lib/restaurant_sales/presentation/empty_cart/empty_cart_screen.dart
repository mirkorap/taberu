import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taberu/core/presentation/message_box/message_box_screen.dart';
import 'package:taberu/router.gr.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageBoxScreen(
      onPressed: () => context.replaceRoute(const DishesSelectionRoute()),
      buttonText: tr('empty_cart.button_text'),
      icon: Icons.shopping_cart_outlined,
      title: tr('empty_cart.title'),
      subtitle: tr('empty_cart.subtitle'),
    );
  }
}
