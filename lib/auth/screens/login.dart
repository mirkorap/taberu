import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/auth/widgets/login_form.dart';
import 'package:taberu/auth/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: LoginHeader(),
            ),
            Padding(
              padding: StiloEdge.a16,
              child: LoginForm(
                onLogin: () => print('Login success!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
