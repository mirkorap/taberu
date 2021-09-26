import 'package:dartz/dartz.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/application/restaurant_configuration/restaurant_configuration_cubit.dart';
import 'package:taberu/restaurant_menu/domain/entities/restaurant_table.dart';
import 'package:taberu/restaurant_menu/infrastructure/extension_methods/kt_configuration.dart';
import 'package:taberu/restaurant_sales/application/cart/cart_cubit.dart';
import 'package:taberu/themes/app_input.dart';

class RestaurantTableSelectBox extends StatelessWidget {
  const RestaurantTableSelectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantConfigurationCubit, RestaurantConfigurationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (configurations) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'checkout.restaurant_table',
                  style: Theme.of(context).textTheme.headline2,
                ).tr(),
                StiloSpacing.vert4,
                DropdownSearch<RestaurantTable>(
                  mode: Mode.MENU,
                  dropdownSearchDecoration: AppInput.selectBoxField,
                  items: configurations.restaurantTables.asList(),
                  itemAsString: (restaurantTable) => restaurantTable.name,
                  validator: (value) => optionOf(value).fold(() => tr('app.failures.empty'), (a) => null),
                  onChanged: (value) {
                    final cubit = context.read<CartCubit>();
                    cubit.changeRestaurantTable(value!);
                  },
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
