import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/locale.dart';
import 'package:taberu/themes/app_theme.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(const AppLocale(child: TaberuApp()));
}

class TaberuApp extends StatelessWidget {
  const TaberuApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('app.title'),
      theme: AppTheme.build(),
      home: Text(tr('app.title')),
    );
  }
}
