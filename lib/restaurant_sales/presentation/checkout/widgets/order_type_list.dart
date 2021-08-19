import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_type.dart';
import 'package:taberu/restaurant_sales/presentation/checkout/widgets/order_type_list_tile.dart';

class OrderTypeList extends StatelessWidget {
  const OrderTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'checkout.order_type',
              style: Theme.of(context).textTheme.headline2,
            ).tr(),
            StiloSpacing.vert6,
            ...OrderType.values.asMap().entries.map((entry) {
              return Column(
                children: [
                  OrderTypeListTile(
                    onChanged: (value) {
                      final cubit = context.read<CartCubit>();
                      cubit.changeOrderType(value!);
                    },
                    value: entry.value,
                    groupValue: state.order.type,
                    borderRadius: _calculateBorderRadius(entry.key),
                  ),
                  Visibility(
                    visible: _canShowDivider(entry.key),
                    child: const Divider(),
                  ),
                ],
              );
            }),
          ],
        );
      },
    );
  }

  BorderRadius _calculateBorderRadius(int index) {
    if (index == 0) {
      return StiloBorderRadius.topXl3;
    }

    if (index == (OrderType.values.length - 1)) {
      return StiloBorderRadius.bottomXl3;
    }

    return StiloBorderRadius.allNone;
  }

  bool _canShowDivider(int index) {
    return index != (OrderType.values.length - 1);
  }
}
