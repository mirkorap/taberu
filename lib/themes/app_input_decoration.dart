import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppInputDecoration {
  static final searchTextField = InputDecoration(
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.a2,
    prefixIcon: const Icon(Icons.search),
    labelText: tr('app.actions.search'),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    ),
  );
}
