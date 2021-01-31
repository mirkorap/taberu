import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

abstract class AppInputDecoration {
  static const searchTextField = InputDecoration(
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: StiloEdge.a2,
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
    ),
  );
}
