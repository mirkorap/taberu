import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppBorder {
  static const roundedButton = RoundedRectangleBorder(
    borderRadius: StiloBorderRadius.allXl6,
  );

  static const decreaseButton = RoundedRectangleBorder(
    borderRadius: StiloBorderRadius.leftXl2,
  );

  static const quantityButton = RoundedRectangleBorder();

  static const increaseButton = RoundedRectangleBorder(
    borderRadius: StiloBorderRadius.rightXl2,
  );

  static const searchTextField = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: StiloBorderRadius.allFull,
  );

  static const dishCard = StiloBorderRadius.allXl6;
}
