import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/bottom_navigation_bar.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_contacts/widgets/restaurant_information.dart';
import 'package:taberu/restaurant_menu/presentation/restaurant_contacts/widgets/restaurant_map.dart';

class RestaurantContactsScreen extends StatelessWidget {
  const RestaurantContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedRestaurant = getIt<ISelectedRestaurantStorage>().getRestaurant();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: StiloEdge.all8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'restaurant_contacts.title',
                style: Theme.of(context).textTheme.headline1,
              ).tr(),
              StiloSpacing.vert6,
              RestaurantMap(position: selectedRestaurant.position),
              StiloSpacing.vert6,
              RestaurantInformation(restaurant: selectedRestaurant),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBar(),
    );
  }
}
