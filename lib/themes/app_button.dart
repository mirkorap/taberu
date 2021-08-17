import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppButton {
  static final roundedButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.buttonText),
      shape: MaterialStateProperty.all(AppBorder.roundedButton),
      elevation: MaterialStateProperty.all(StiloElevation.z0),
      minimumSize: MaterialStateProperty.all(const Size(314.0, 70.0)),
    ),
  );

  static final disabledRoundedButton = ElevatedButtonThemeData(
    style: roundedButton.style!.copyWith(
      backgroundColor: MaterialStateProperty.all(AppColor.secondary),
      foregroundColor: MaterialStateProperty.all(StiloColor.trueGrey[700]),
    ),
  );

  static final decreaseButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline3),
      shape: MaterialStateProperty.all(AppBorder.decreaseButton),
      elevation: MaterialStateProperty.all(StiloElevation.z0),
    ),
  );

  static final quantityButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline4),
      shape: MaterialStateProperty.all(AppBorder.quantityButton),
      elevation: MaterialStateProperty.all(StiloElevation.z0),
    ),
  );

  static final increaseButton = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.headline3),
      shape: MaterialStateProperty.all(AppBorder.increaseButton),
      elevation: MaterialStateProperty.all(StiloElevation.z0),
    ),
  );
}
