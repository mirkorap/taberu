import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/restaurant_menu/application/menu_navigation/menu_navigation_cubit.dart';
import 'package:taberu/themes/app_tab_navigation.dart';

class RestaurantMenuTabs extends StatelessWidget {
  const RestaurantMenuTabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuNavigationCubit, MenuNavigationState>(
      listener: (context, state) {
        state.maybeWhen(
          loadFailure: (failure) {
            FlushbarHelper.createError(
              duration: StiloDuration.d5000,
              message: failure.map(
                insufficientPermissions: (_) => tr('app.failures.insufficient_permissions'),
                unexpected: (_) => tr('dishes_selection.failures.unexpected'),
              ),
            ).show(context);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Theme(
          data: ThemeData(
            tabBarTheme: AppTabNavigation.restaurantMenuTabBar,
          ),
          child: DefaultTabController(
            length: state.maybeWhen(
              loadSuccess: (menus) => menus.size,
              orElse: () => 0,
            ),
            child: TabBar(
              isScrollable: true,
              tabs: state.maybeWhen(
                loadSuccess: (menus) {
                  return menus.map((menu) => Tab(text: menu.name)).asList();
                },
                orElse: () => [],
              ),
            ),
          ),
        );
      },
    );
  }
}
