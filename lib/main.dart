import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:taberu/core/presentation/taberu_app.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/locale.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(const AppLocale(child: TaberuApp()));
}
