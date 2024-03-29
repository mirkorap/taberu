import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/bottom_navigation_bar.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/restaurant_menu/application/dish_search/dish_search_cubit.dart';
import 'package:taberu/restaurant_menu/application/menu_navigation/menu_navigation_cubit.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/widgets/restaurant_dishes.dart';
import 'package:taberu/restaurant_menu/presentation/dishes_selection/widgets/restaurant_menu_tabs.dart';
import 'package:taberu/themes/app_input.dart';

class DishesSelectionScreen extends HookWidget {
  const DishesSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dishSearchBarState = useState('');

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
            padding: StiloEdge.all8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: dishSearchBarState.value.isEmpty,
                  child: Text(
                    'dishes_selection.title',
                    style: Theme.of(context).textTheme.headline1,
                  ).tr(),
                ),
                StiloSpacing.vert6,
                BlocBuilder<DishSearchCubit, DishSearchState>(
                  builder: (context, state) {
                    return Form(
                      child: TextFormField(
                        onChanged: (value) {
                          final cubit = context.read<DishSearchCubit>();
                          cubit.searchByName(value);
                          dishSearchBarState.value = value;
                        },
                        decoration: AppInput.searchTextField,
                      ),
                    );
                  },
                ),
                StiloSpacing.vert6,
                if (dishSearchBarState.value.isEmpty) ...[
                  const RestaurantMenuTabs(),
                  StiloSpacing.vert8,
                  const RestaurantDishes(scrollDirection: Axis.horizontal),
                ],
                if (dishSearchBarState.value.isNotEmpty) ...[
                  const RestaurantDishes(scrollDirection: Axis.vertical),
                ],
              ],
            ),
          ),
          bottomNavigationBar: Visibility(
            visible: dishSearchBarState.value.isEmpty,
            child: const BottomNavigationBar(),
          ),
        ),
      ),
    );
  }
}
