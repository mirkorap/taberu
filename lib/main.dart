import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/locale.dart';
import 'package:taberu/router.gr.dart' as router;
import 'package:taberu/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(const AppLocale(child: TaberuApp()));
}

class TaberuApp extends StatelessWidget {
  const TaberuApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tr('app.title'),
      debugShowCheckedModeBanner: false, // TODO: hide based on environment
      theme: AppTheme.build(),
      builder: ExtendedNavigator.builder(router: router.Router()),
    );
  }
}
