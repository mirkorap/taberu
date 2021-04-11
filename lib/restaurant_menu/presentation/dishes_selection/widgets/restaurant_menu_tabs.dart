import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:taberu/restaurant_menu/application/dish_search/dish_search_cubit.dart';
import 'package:taberu/restaurant_menu/application/menu_navigation/menu_navigation_cubit.dart';
import 'package:taberu/themes/app_tab_navigation.dart';

class RestaurantMenuTabs extends StatelessWidget {
  const RestaurantMenuTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuNavigationCubit, MenuNavigationState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (menus) {
            final cubit = context.read<DishSearchCubit>();
            if (menus.isNotEmpty()) cubit.searchByMenu(menus[0].id.getOrCrash());

            return Theme(
              data: ThemeData(
                tabBarTheme: AppTabNavigation.restaurantMenuTabBar,
              ),
              child: DefaultTabController(
                length: menus.size,
                child: TabBar(
                  onTap: (index) => cubit.searchByMenu(menus[index].id.getOrCrash()),
                  isScrollable: true,
                  tabs: menus.map((menu) => Tab(text: menu.name)).asList(),
                ),
              ),
            );
          },
          orElse: () => Container(),
        );
      },
    );
  }
}
