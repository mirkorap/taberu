import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_image.dart';

class SplashScreen extends StatelessWidget {
  final PageRouteInfo nextRoute;
  final Future beforeNavigation;

  const SplashScreen({
    Key? key,
    required this.nextRoute,
    required this.beforeNavigation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: beforeNavigation.whenComplete(
        () => context.replaceRoute(nextRoute),
      ),
      builder: (context, snapshot) {
        return SafeArea(
          child: Stack(
            children: [
              Image.asset(
                AppImage.splashScreen,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                alignment: Alignment.center,
                margin: StiloEdge.top36,
                child: const CircularProgressIndicator(
                  valueColor: AppColor.circularProgressIndicator,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
