import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_delivery_costs.dart';

class OrderTotals extends StatelessWidget {
  const OrderTotals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'checkout.subtotal',
                  style: Theme.of(context).textTheme.headline3,
                ).tr(),
                Text(
                  state.order.subtotal.toString(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            StiloSpacing.vert2,
            if (state.order.isDeliveredAtHome) ...[
              const OrderDeliveryCosts(),
              StiloSpacing.vert2,
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'checkout.total',
                  style: Theme.of(context).textTheme.headline1,
                ).tr(),
                Text(
                  state.order.total.toString(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
