import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/top_navigation_bar.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/restaurant_configuration/restaurant_configuration_cubit.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_type_list.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/restaurant_table_select_box.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantConfigurationCubit>(
      create: (context) => getIt<RestaurantConfigurationCubit>()..load(),
      child: Scaffold(
        appBar: const TopNavigationBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: StiloEdge.horiz8,
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const OrderTypeList(),
                    StiloSpacing.vert6,
                    Visibility(
                      visible: state.order.isDeliveredAtTable,
                      child: const RestaurantTableSelectBox(),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
