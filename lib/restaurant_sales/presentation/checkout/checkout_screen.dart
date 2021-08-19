import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/top_navigation_bar.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_type_list.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: StiloEdge.horiz8,
          child: Column(
            children: [
              const OrderTypeList(),
            ],
          ),
        ),
      ),
    );
  }
}
