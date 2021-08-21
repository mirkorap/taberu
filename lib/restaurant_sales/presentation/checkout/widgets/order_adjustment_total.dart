import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taberu/restaurant_menu/application/restaurant_configuration/restaurant_configuration_cubit.dart';
import 'package:taberu/restaurant_menu/infrastructure/extension_methods/kt_configuration.dart';
import 'package:taberu/restaurant_sales/domain/entities/order.dart';

class OrderAdjustmentTotal extends StatelessWidget {
  final Order order;

  const OrderAdjustmentTotal({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantConfigurationCubit, RestaurantConfigurationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (configurations) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.isDeliveredAtTable ? 'checkout.cover_charge' : 'checkout.delivery_costs',
                      style: Theme.of(context).textTheme.headline3,
                    ).tr(),
                    Text(
                      (order.isDeliveredAtTable ? configurations.coverCharge : configurations.deliveryCosts).toString(),
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ],
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
