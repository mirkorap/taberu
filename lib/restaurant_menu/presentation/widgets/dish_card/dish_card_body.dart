import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/domain/value_objects/money.dart';
import 'package:taberu/themes/app_text_style.dart';

class DishCardBody extends StatelessWidget {
  final String name;
  final Money price;

  const DishCardBody({
    Key key,
    @required this.name,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.0,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        StiloSpacing.y2,
        Text(
          price.toString(),
          style: AppTextStyle.priceText,
        ),
      ],
    );
  }
}
