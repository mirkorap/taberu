import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/dish_search/dish_search_cubit.dart';
import 'package:taberu/restaurant_menu/application/menu_navigation/menu_navigation_cubit.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/widgets/restaurant_dishes.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/widgets/restaurant_menu_tabs.dart';
import 'package:taberu/restaurant_menu/presentation/widgets/bottom_navigation_menu/bottom_navigation_menu.dart';
import 'package:taberu/themes/app_input.dart';

class DishesSelectionScreen extends StatelessWidget {
  const DishesSelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuNavigationCubit>(
          create: (context) => getIt<MenuNavigationCubit>()..load(),
        ),
        BlocProvider<DishSearchCubit>(
          create: (context) => getIt<DishSearchCubit>(),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(StiloEdge.edge10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'dishes_selection.title',
                  style: Theme.of(context).textTheme.headline1,
                ).tr(),
                StiloSpacing.y8,
                Form(
                  child: TextFormField(
                    decoration: AppInput.searchTextField,
                  ),
                ),
                StiloSpacing.y8,
                const RestaurantMenuTabs(),
                StiloSpacing.y10,
                const RestaurantDishes(),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavigationMenu(),
        ),
      ),
    );
  }
}
