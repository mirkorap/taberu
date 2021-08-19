import 'package:flutter/material.dart';
import 'package:taberu/themes/app_color.dart';

abstract class AppRadio {
  static final primary = RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColor.primary),
  );
}
