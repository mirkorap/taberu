import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/bloc.dart';
import 'package:taberu/injection.dart';
import 'package:taberu/locale.dart';
import 'package:taberu/restaurant_menu/application/services/i_selected_restaurant_storage.dart';
import 'package:taberu/restaurant_sales/application/guards/cart_guard.dart';
import 'package:taberu/router.gr.dart';
import 'package:taberu/themes/app_image.dart';
import 'package:taberu/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  runApp(AppLocale(child: TaberuApp()));
}

class TaberuApp extends StatelessWidget {
  final _appRouter = AppRouter(cartGuard: getIt<CartGuard>());

  TaberuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBloc(
      child: MaterialApp.router(
        title: tr('app.title'),
        debugShowCheckedModeBanner: false, // TODO: hide based on environment
        theme: AppTheme.build(),
        routerDelegate: _appRouter.delegate(initialRoutes: [
          _buildInitialRoute(context),
        ]),
        routeInformationParser: _appRouter.defaultRouteParser(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }

  PageRouteInfo _buildInitialRoute(BuildContext context) {
    return SplashRoute(
      nextRoute: _nextRoute,
      beforeNavigation: Future.wait([
        Future.delayed(StiloDuration.d3000),
        AppImage.precacheImages(context),
      ]),
    );
  }

  PageRouteInfo get _nextRoute {
    final selectedRestaurantStorage = getIt<ISelectedRestaurantStorage>();
    if (selectedRestaurantStorage.containsRestaurant()) {
      return const DishesSelectionRoute();
    }

    return const RestaurantSelectionRoute();
  }
}
