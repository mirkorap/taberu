import 'package:flutter/material.dart';

abstract class AppBorder {
  static const roundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.all(Radius.circular(30.0)),
  );

  static const searchTextField = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(100.0)),
  );

  static const dishCard = BorderRadiusDirectional.all(
    Radius.circular(30.0),
  );
}
