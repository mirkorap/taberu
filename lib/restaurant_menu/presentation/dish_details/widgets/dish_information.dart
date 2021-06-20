import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/domain/entities/dish.dart';

class DishInformation extends StatelessWidget {
  final Dish dish;

  const DishInformation({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dish.description.isNotEmpty) ...[
          ListTile(
            title: Text(
              'dish_details.description',
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            subtitle: Text(
              dish.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          StiloSpacing.vert5,
        ],
        if (dish.ingredients.isNotEmpty) ...[
          ListTile(
            title: Text(
              'dish_details.ingredients',
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            subtitle: Text(
              dish.ingredients,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          StiloSpacing.vert5,
        ],
        if (dish.allergens.isNotEmpty) ...[
          ListTile(
            title: Text(
              'dish_details.allergens',
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            subtitle: Text(
              dish.allergens,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          StiloSpacing.vert5,
        ],
      ],
    );
  }
}
