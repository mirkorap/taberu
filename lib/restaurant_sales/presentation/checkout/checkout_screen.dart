import 'package:another_flushbar/flushbar_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/infrastructure/extension_methods/auto_router.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/top_navigation_bar.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/restaurant_configuration/restaurant_configuration_cubit.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/confirm_order_button.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/delivery_address.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/notes_field.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_totals.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_type_list.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/restaurant_table_select_box.dart';
import 'package:taberu/router.gr.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantConfigurationCubit>(
      create: (context) => getIt<RestaurantConfigurationCubit>()..load(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          return state.saveFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                FlushbarHelper.createError(
                  message: failure.maybeMap(
                    insufficientPermissions: (_) => tr('app.failures.insufficient_permissions'),
                    orElse: () => tr('app.failures.unexpected'),
                  ),
                ).show(context);
              },
              (_) => context.replaceAll([const CheckoutSuccessRoute()]),
            ),
          );
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              appBar: const TopNavigationBar(),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: StiloEdge.horiz8,
                  child: Form(
                    autovalidateMode: state.showErrorMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        const OrderTypeList(),
                        StiloSpacing.vert6,
                        Visibility(
                          visible: state.order.isDeliveredAtTable,
                          child: const RestaurantTableSelectBox(),
                        ),
                        Visibility(
                          visible: state.order.isDeliveredAtHome,
                          child: const DeliveryAddress(),
                        ),
                        StiloSpacing.vert6,
                        const NotesField(),
                        const SizedBox(
                          height: StiloHeight.h20,
                          child: Divider(),
                        ),
                        const OrderTotals(),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: const ConfirmOrderButton(),
            ),
          );
        },
      ),
    );
  }
}
