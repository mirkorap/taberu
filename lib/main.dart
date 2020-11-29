import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taberu/locale.dart';
import 'package:taberu/routes.dart';
import 'package:taberu/themes/app_theme.dart';

void main() {
  runApp(AppLocale(child: TaberuApp()));
}

class TaberuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('app.title'),
      theme: AppTheme.build(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
