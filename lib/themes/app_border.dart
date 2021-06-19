import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppBorder {
  static const roundedButton = RoundedRectangleBorder(
    borderRadius: StiloBorderRadius.allXl6,
  );

  static const searchTextField = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: StiloBorderRadius.allFull,
  );

  static const dishCard = StiloBorderRadius.allXl6;
}
