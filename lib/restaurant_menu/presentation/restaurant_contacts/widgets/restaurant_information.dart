import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/buttons/link_button.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_contacts/widgets/restaurant_week_opening_time.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (restaurant.weekOpeningTime.isNotEmpty) ...[
          Text(
            'restaurant_contacts.opening_time',
            style: Theme.of(context).textTheme.headline3,
          ).tr(),
          StiloSpacing.vert2,
          RestaurantWeekOpeningTime(weekOpeningTime: restaurant.weekOpeningTime),
          StiloSpacing.vert6,
        ],
        Text(
          'restaurant_contacts.address',
          style: Theme.of(context).textTheme.headline3,
        ).tr(),
        StiloSpacing.vert2,
        Text(
          restaurant.address.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        StiloSpacing.vert6,
        Text(
          'restaurant_contacts.email_address',
          style: Theme.of(context).textTheme.headline3,
        ).tr(),
        StiloSpacing.vert2,
        LinkButton(
          onTap: () => launch('mailto:${restaurant.emailAddress.getOrCrash()}'),
          text: restaurant.emailAddress.getOrCrash(),
        ),
        StiloSpacing.vert6,
        Text(
          'restaurant_contacts.phone',
          style: Theme.of(context).textTheme.headline3,
        ).tr(),
        StiloSpacing.vert2,
        LinkButton(
          onTap: () => launch('tel:${restaurant.phone.getOrCrash()}'),
          text: restaurant.phone.getOrCrash(),
        ),
        StiloSpacing.vert6,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => launch('url:${restaurant.websiteUrl}'),
              icon: const Icon(Icons.public),
              color: AppColor.primary,
            ),
            IconButton(
              onPressed: () => launch('url:${restaurant.facebookUrl}'),
              icon: const Icon(AppIcon.facebook),
              color: AppColor.primary,
            ),
            IconButton(
              onPressed: () => launch('url:${restaurant.instagramUrl}'),
              icon: const Icon(AppIcon.instagram),
              color: AppColor.primary,
            ),
          ],
        ),
      ],
    );
  }
}
