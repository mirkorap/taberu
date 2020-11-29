import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/auth/widgets/login_form.dart';
import 'package:taberu/auth/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AspectRatio(
              aspectRatio: 1.5,
              child: LoginHeader(),
            ),
            Padding(
              padding: StiloEdge.a16,
              child: LoginForm(
                onLogin: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
