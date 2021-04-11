import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border.dart';

abstract class AppInput {
  static final searchTextField = InputDecoration(
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.a2,
    prefixIcon: const Icon(Icons.search),
    labelText: tr('app.actions.search'),
    border: AppBorder.searchTextField,
  );
}
