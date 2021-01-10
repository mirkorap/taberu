import 'package:flutter/material.dart';

abstract class AppBorderRadius {
  static const roundedButton = RoundedRectangleBorder(
    borderRadius: BorderRadiusDirectional.all(Radius.circular(30.0)),
  );
}
