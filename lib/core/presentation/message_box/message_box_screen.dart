import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';

class MessageBoxScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final String? buttonText;

  const MessageBoxScreen({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onPressed,
    this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: StiloEdge.all10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.secondary,
              size: 115.0,
            ),
            StiloSpacing.vert2,
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            StiloSpacing.vert2,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: onPressed != null,
        child: Padding(
          padding: StiloEdge.all6,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText.toString()),
          ),
        ),
      ),
    );
  }
}
