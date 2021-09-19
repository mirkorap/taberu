import 'package:easy_localization/easy_localization.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_sales/domain/enums/order_type.dart';

class OrderTypeListTile extends StatelessWidget {
  final ValueChanged<OrderType?> onChanged;
  final OrderType value;
  final OrderType groupValue;
  final BorderRadius borderRadius;

  const OrderTypeListTile({
    Key? key,
    required this.onChanged,
    required this.value,
    required this.groupValue,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: RadioListTile<OrderType>(
        onChanged: onChanged,
        value: value,
        groupValue: groupValue,
        contentPadding: StiloEdge.all4,
        tileColor: StiloColor.white,
        title: Text(
          'checkout.${EnumToString.convertToString(value)}',
          style: Theme.of(context).textTheme.headline4,
        ).tr(),
      ),
    );
  }
}
