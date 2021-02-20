import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border_radius.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppButton {
  static final roundedButton = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColor.primary),
      foregroundColor: MaterialStateProperty.all(StiloColor.white),
      textStyle: MaterialStateProperty.all(AppTextStyle.buttonText),
      shape: MaterialStateProperty.all(AppBorderRadius.roundedButton),
      minimumSize: MaterialStateProperty.all(const Size(314.0, 70.0)),
    ),
  );
}
