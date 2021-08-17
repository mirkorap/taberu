import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/cart/widgets/cart_list_tile.dart';
import 'package:taberu/themes/app_image.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.swipeIcon),
                StiloSpacing.horiz2,
                Text(
                  'cart.swipe_to_delete',
                  style: Theme.of(context).textTheme.bodyText1,
                ).tr(),
              ],
            ),
            StiloSpacing.vert6,
            for (final orderItem in state.order.orderItems.iter) ...[
              CartListTile(
                onDelete: () {
                  final cubit = context.read<CartCubit>();
                  cubit.deleteFromCart(orderItem.dish);
                },
                onDecreaseQuantity: () {
                  final cubit = context.read<CartCubit>();
                  cubit.removeOneFromCart(orderItem.dish);
                },
                onIncreaseQuantity: () {
                  final cubit = context.read<CartCubit>();
                  cubit.addOneToCart(orderItem.dish);
                },
                orderItem: orderItem,
              ),
              StiloSpacing.vert6,
            ],
          ],
        );
      },
    );
  }
}
