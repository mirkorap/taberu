import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/bottom_navigation_bar.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/cart/widgets/cart_list_tile.dart';
import 'package:taberu/themes/app_image.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Center(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        for (final orderItem in state.order.orderItems.iter) ...[
                          StiloSpacing.vert6,
                          CartListTile(
                            onDelete: () {},
                            orderItem: orderItem,
                          ),
                        ],
                        StiloSpacing.vert8,
                        TextButton(
                          onPressed: () {},
                          child: const Text('cart.complete_order').tr(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBar(),
    );
  }
}
