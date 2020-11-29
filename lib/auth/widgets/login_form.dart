import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onLogin;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginForm({Key key, @required this.onLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          StiloSpacing.y20,
          TextButton(
            onPressed: onLogin,
            child: Text('auth.login').tr(),
          ),
        ],
      ),
    );
  }
}
