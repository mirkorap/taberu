import 'package:flutter/material.dart';
import 'package:taberu/themes/app_text_style.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const LinkButton({
    Key key,
    @required this.onTap,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: AppTextStyle.linkButtonText,
      ),
    );
  }
}
