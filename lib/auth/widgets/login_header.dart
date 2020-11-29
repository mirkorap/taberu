import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_border_radius.dart';
import 'package:taberu/themes/app_image.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: StiloColor.white,
        borderRadius: AppBorderRadius.loginHeader,
      ),
      child: Center(
        child: Image.asset(
          AppImage.logo,
          scale: 0.5,
        ),
      ),
    );
  }
}
