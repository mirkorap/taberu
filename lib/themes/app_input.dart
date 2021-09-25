import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_text_style.dart';

abstract class AppInput {
  static final inputTextField = InputDecoration(
    filled: true,
    fillColor: StiloColor.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.all5,
    border: AppBorder.inputTextField,
    errorStyle: AppTextStyle.headline5.copyWith(
      color: AppColor.danger,
    ),
  );

  static final searchTextField = InputDecoration(
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.all2,
    prefixIcon: const Icon(Icons.search),
    labelText: tr('app.actions.search'),
    border: AppBorder.searchTextField,
  );

  static final selectBoxField = InputDecoration(
    filled: true,
    fillColor: StiloColor.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.all2,
    prefixIcon: const Icon(Icons.search),
    labelText: tr('app.actions.select'),
    border: AppBorder.selectBoxField,
    errorStyle: AppTextStyle.headline5.copyWith(
      color: AppColor.danger,
    ),
  );
}
