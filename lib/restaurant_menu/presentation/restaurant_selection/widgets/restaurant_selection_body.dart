import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/buttons/link_button.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/restaurant_search/restaurant_search_cubit.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_input.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantSelectionBody extends StatelessWidget {
  const RestaurantSelectionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Restaurant? selectedRestaurant;

    return BlocConsumer<RestaurantSearchCubit, RestaurantSearchState>(
      listener: (context, state) {
        state.maybeWhen(
          searchFailure: (failure) {
            FlushbarHelper.createError(
              duration: StiloDuration.d5000,
              message: failure.map(
                insufficientPermissions: (_) => tr('app.failures.insufficient_permissions'),
                unexpected: (_) => tr('restaurant_selection.failures.unexpected'),
              ),
            ).show(context);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            DropdownSearch<Restaurant>(
              mode: Mode.BOTTOM_SHEET,
              isFilteredOnline: true,
              showSearchBox: true,
              itemAsString: (restaurant) => restaurant.name,
              dropdownSearchDecoration: AppInput.searchTextField.copyWith(
                labelText: tr('restaurant_selection.select_restaurant'),
              ),
              searchBoxDecoration: AppInput.searchTextField,
              popupShape: const RoundedRectangleBorder(
                borderRadius: StiloBorderRadius.topXl3,
              ),
              emptyBuilder: (context, searchEntry) {
                return Center(
                  child: Text(
                    searchEntry != null ? 'app.type_to_search' : 'app.no_results_found',
                    style: Theme.of(context).textTheme.bodyText1,
                  ).tr(),
                );
              },
              onFind: (String restaurantName) async {
                final cubit = context.read<RestaurantSearchCubit>();
                cubit.searchByName(restaurantName);

                return state.maybeWhen(
                  searchSuccess: (restaurants) => restaurants.asList(),
                  orElse: () => [],
                );
              },
              onChanged: (restaurant) => selectedRestaurant = restaurant,
            ),
            StiloSpacing.vert8,
            TextButton(
              onPressed: () {
                final storage = getIt<ISelectedRestaurantStorage>();
                storage.setRestaurant(selectedRestaurant!);
                context.router.replace(const DishesSelectionScreen());
              },
              child: const Text('restaurant_selection.show_menu').tr(),
            ),
            StiloSpacing.vert4,
            LinkButton(
              onTap: () => launch('https://www.google.com'),
              text: tr('restaurant_selection.register_restaurant'),
            ),
          ],
        );
      },
    );
  }
}
