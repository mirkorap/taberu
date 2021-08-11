import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppBoxShadow {
  static const dishCard = [
    BoxShadow(
      color: StiloColor.black20,
      blurRadius: 10.0,
      spreadRadius: 1.0,
    ),
  ];

  static const cartListTile = [
    BoxShadow(
      color: StiloColor.black20,
      offset: Offset(0.0, 5.0),
      blurRadius: 10.0,
    ),
  ];
}
