import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class TopNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const TopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: StiloColor.transparent,
      elevation: StiloElevation.z0,
      toolbarHeight: StiloHeight.h24,
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(
          Icons.chevron_left,
          color: StiloColor.black,
          size: 30.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(StiloHeight.h16);
}
