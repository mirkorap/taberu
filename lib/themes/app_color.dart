import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppColor {
  static const primary = Color(0xFFFA4A0C);
  static const accent = Color(0x80000000);
  static const success = Color(0xFF2F855A);
  static const danger = Color(0xFFDF2C2C);
  static const disabled = Color(0xFFADADAF);

  static const background = Color(0xFFF2F2F2);
  static const circularProgressIndicator = AlwaysStoppedAnimation(primary);
  static const actionProgressIndicator = AlwaysStoppedAnimation(StiloColor.white);
}
