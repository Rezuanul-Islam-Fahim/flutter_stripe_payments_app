import 'package:flutter/material.dart';

import 'helpers/auth_helper.dart';
import 'widgets/auth_form.dart';
import 'widgets/auth_link.dart';
import 'widgets/auth_page_heading.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthPageHeading(),
            AuthForm(authMode: AuthMode.login),
            const AuthLink(authMode: AuthMode.login),
          ],
        ),
      ),
    );
  }
}
