import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppButton {
  static final roundedButton = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.buttonText),
      shape: MaterialStateProperty.all(AppBorder.roundedButton),
      minimumSize: MaterialStateProperty.all(const Size(314.0, 70.0)),
    ),
  );

  static final decreaseButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline3),
      shape: MaterialStateProperty.all(AppBorder.decreaseButton),
    ),
  );

  static final quantityButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline4),
      shape: MaterialStateProperty.all(AppBorder.quantityButton),
    ),
  );

  static final increaseButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline3),
      shape: MaterialStateProperty.all(AppBorder.increaseButton),
    ),
  );
}
