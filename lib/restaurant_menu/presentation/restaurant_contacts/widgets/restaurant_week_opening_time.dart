import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taberu/core/domain/value_objects/limited_list.dart';
import 'package:taberu/core/infrastructure/extension_methods/dartz_value_object.dart';
import 'package:taberu/restaurant_menu/domain/value_objects/opening_time.dart';

class RestaurantWeekOpeningTime extends StatelessWidget {
  final LimitedList<OpeningTime> weekOpeningTime;

  const RestaurantWeekOpeningTime({
    Key? key,
    required this.weekOpeningTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: weekOpeningTime.map((openingTime) {
        return TableRow(
          children: [
            TableCell(
              child: Text(
                'restaurant_contacts.days_of_week.${openingTime.dayOfWeek.getOrCrash().asString()}',
                style: Theme.of(context).textTheme.headline4,
              ).tr(),
            ),
            TableCell(
              child: Text(
                openingTime.timeRange,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        );
      }).asList(),
    );
  }
}
