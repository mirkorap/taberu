import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/widgets/buttons/link_button.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onCreateMenu;
  final VoidCallback onLogin;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginForm({
    Key key,
    @required this.onCreateMenu,
    @required this.onLogin,
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
              labelText: tr('auth.email'),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: tr('auth.password'),
            ),
          ),
          StiloSpacing.y8,
          LinkButton(
            text: tr('auth.create_menu'),
            onTap: onCreateMenu,
          ),
          StiloSpacing.y16,
          TextButton(
            onPressed: onLogin,
            child: const Text('auth.login').tr(),
          ),
        ],
      ),
    );
  }
}
