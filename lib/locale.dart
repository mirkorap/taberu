import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLocale extends StatelessWidget {
  static const String _translationPath = 'assets/translations';
  static const Locale _fallbackLocale = Locale('en', 'US');
  static const List<Locale> _supportedLocales = [
    Locale('en', 'US'),
    Locale('it', 'IT'),
  ];

  final Widget child;

  const AppLocale({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: _translationPath,
      fallbackLocale: _fallbackLocale,
      supportedLocales: _supportedLocales,
      child: child,
    );
  }
}
