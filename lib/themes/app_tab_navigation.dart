import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppTabNavigation {
  static final restaurantMenuTabBar = TabBarTheme(
    labelColor: AppColor.primary,
    labelStyle: AppTextStyle.headline3,
    unselectedLabelColor: AppColor.secondary,
    unselectedLabelStyle: AppTextStyle.headline4,
    indicator: UnderlineTabIndicator(
      borderSide: StiloBorder.side4(AppColor.primary),
    ),
  );
}
