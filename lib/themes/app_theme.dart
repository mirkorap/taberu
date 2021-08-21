import 'package:flutter/material.dart';
import 'package:taberu/themes/app_button.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_divider.dart';
import 'package:taberu/themes/app_radio.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppTheme {
  static ThemeData build() {
    return ThemeData(
      primaryColor: AppColor.primary,
      accentColor: AppColor.accent,
      backgroundColor: AppColor.background,
      scaffoldBackgroundColor: AppColor.background,
      elevatedButtonTheme: AppButton.roundedButton,
      radioTheme: AppRadio.primary,
      dividerTheme: AppDivider.primary,
      textTheme: TextTheme(
        headline1: AppTextStyle.headline1,
        headline2: AppTextStyle.headline2,
        headline3: AppTextStyle.headline3,
        headline4: AppTextStyle.headline4,
        headline5: AppTextStyle.headline5,
        bodyText1: AppTextStyle.bodyText1,
        bodyText2: AppTextStyle.bodyText2,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
