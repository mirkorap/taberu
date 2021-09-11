import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/bottom_navigation_bar.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/cart/widgets/cart_list.dart';
import 'package:taberu/router.gr.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (!state.order.hasOrderItems()) {
          context.replaceRoute(const EmptyCartRoute());
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: StiloEdge.all8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'cart.title',
                  style: Theme.of(context).textTheme.headline1,
                ).tr(),
                StiloSpacing.vert6,
                const CartList(),
                StiloSpacing.vert6,
                Center(
                  child: ElevatedButton(
                    onPressed: () => context.pushRoute(const CheckoutRoute()),
                    child: const Text('cart.complete_order').tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationBar(),
      ),
    );
  }
}
