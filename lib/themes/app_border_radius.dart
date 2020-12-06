import 'package:flutter/material.dart';

abstract class AppBorderRadius {
  static const roundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.all(Radius.circular(30.0)),
  );

  static const logoBoxContainer = BorderRadiusDirectional.vertical(
    bottom: Radius.circular(30.0),
  );
}
