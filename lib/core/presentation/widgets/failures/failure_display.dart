import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_color.dart';

class FailureDisplay extends StatelessWidget {
  final String message;

  const FailureDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error,
            color: AppColor.danger,
            size: StiloFontSize.xl6,
          ),
          StiloSpacing.vert2,
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2!.copyWith(color: AppColor.danger),
          ),
        ],
      ),
    );
  }
}
