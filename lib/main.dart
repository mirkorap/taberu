import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/splash/splash_screen.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/locale.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/router.gr.dart' as router;
import 'package:taberu/themes/app_image.dart';
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
    return FutureBuilder(
      future: Future.wait([
        Future.delayed(StiloDuration.d3000),
        AppImage.precacheImages(context),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            title: tr('app.title'),
            debugShowCheckedModeBanner: false, // TODO: hide based on environment
            theme: AppTheme.build(),
            home: const SplashScreen(),
          );
        }

        return MaterialApp(
          title: tr('app.title'),
          debugShowCheckedModeBanner: false, // TODO: hide based on environment
          theme: AppTheme.build(),
          builder: ExtendedNavigator.builder(
            router: router.Router(),
            initialRoute: initialRoute,
          ),
        );
      },
    );
  }

  String get initialRoute {
    final storage = getIt<ISelectedRestaurantStorage>();
    if (storage.containsRestaurant()) {
      return router.Routes.dishesSelectionScreen;
    }

    return router.Routes.restaurantSelectionScreen;
  }
}
