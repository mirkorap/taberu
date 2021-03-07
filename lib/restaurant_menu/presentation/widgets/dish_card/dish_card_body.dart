import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_text_style.dart';

class DishCardBody extends StatelessWidget {
  final String dishName;
  final String dishPrice;

  const DishCardBody({
    Key key,
    @required this.dishName,
    @required this.dishPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.0,
          child: Text(
            dishName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        StiloSpacing.y2,
        Text(
          dishPrice,
          style: AppTextStyle.priceText,
        ),
      ],
    );
  }
}
