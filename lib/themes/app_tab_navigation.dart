import 'package:flutter/material.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppTabNavigation {
  static final restaurantMenuTabBar = TabBarTheme(
    labelColor: AppColor.primary,
    labelStyle: AppTextStyle.headline3,
    unselectedLabelColor: AppColor.disabled,
    unselectedLabelStyle: AppTextStyle.headline4,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
        color: AppColor.primary,
        width: 4.0,
      ),
    ),
  );
}
