import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/core/presentation/widgets/navigation_bars/top_navigation_bar.dart';
import 'package:taberu/themes/app_color.dart';

class MessageBoxScreen extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? buttonText;
  final IconData icon;
  final String title;
  final String subtitle;

  const MessageBoxScreen({
    Key? key,
    this.onPressed,
    this.buttonText,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopNavigationBar(),
      body: Padding(
        padding: StiloEdge.all10,
        child: Center(
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
      ),
      bottomNavigationBar: Visibility(
        visible: onPressed != null,
        child: Padding(
          padding: StiloEdge.all6,
          child: TextButton(
            onPressed: onPressed,
            child: Text(buttonText.toString()),
          ),
        ),
      ),
    );
  }
}
