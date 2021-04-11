import 'package:flutter/material.dart';
import 'package:taberu/themes/app_color.dart';
import 'package:taberu/themes/app_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            AppImage.splashScreen,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 150.0),
            child: const CircularProgressIndicator(
              valueColor: AppColor.circularProgressIndicator,
            ),
          ),
        ],
      ),
    );
  }
}
