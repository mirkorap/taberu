import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_box_shadow.dart';

abstract class AppListTile {
  static const cartListTile = BoxDecoration(
    borderRadius: StiloBorderRadius.allXl3,
    boxShadow: AppBoxShadow.cartListTile,
  );
}
