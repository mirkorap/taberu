import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';

class BottomNavigationMenuItem extends StatelessWidget {
  final String routeName;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const BottomNavigationMenuItem({
    Key key,
    @required this.routeName,
    @required this.activeIcon,
    @required this.inactiveIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCurrentRoute = ModalRoute.of(context).settings.name == routeName;

    return IconButton(
      onPressed: () {
        if (!isCurrentRoute) {
          ExtendedNavigator.of(context).replace(routeName);
        }
      },
      color: isCurrentRoute ? AppColor.primary : AppColor.disabled,
      icon: Icon(isCurrentRoute ? activeIcon : inactiveIcon),
      iconSize: StiloFontSize.xl5,
    );
  }
}
