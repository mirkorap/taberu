import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/widgets/buttons/link_button.dart';

class SelectRestaurantForm extends StatelessWidget {
  final VoidCallback onCreateMenu;
  final VoidCallback onShowMenu;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SelectRestaurantForm({
    Key key,
    @required this.onCreateMenu,
    @required this.onShowMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: tr('restaurant_menu.email'),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: tr('restaurant_menu.password'),
            ),
          ),
          StiloSpacing.y8,
          LinkButton(
            text: tr('restaurant_menu.create_menu'),
            onTap: onCreateMenu,
          ),
          StiloSpacing.y16,
          TextButton(
            onPressed: onShowMenu,
            child: const Text('restaurant_menu.show_menu').tr(),
          ),
        ],
      ),
    );
  }
}
