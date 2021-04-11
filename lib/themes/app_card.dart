import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border.dart';
import 'package:taberu/themes/app_box_shadow.dart';

abstract class AppCard {
  static const dishCard = BoxDecoration(
    color: StiloColor.white,
    borderRadius: AppBorder.dishCard,
    boxShadow: AppBoxShadow.dishCard,
  );
}
