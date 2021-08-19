import 'package:flutter/material.dart';
import 'package:taberu/themes/app_color.dart';

abstract class AppDivider {
  static const primary = DividerThemeData(
    color: AppColor.primary,
    space: 2.0,
    thickness: 2.0,
    indent: 50.0,
    endIndent: 50.0,
  );
}
