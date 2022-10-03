import 'package:flutter/material.dart';

import 'helpers/auth_helper.dart';
import 'widgets/auth_form.dart';
import 'widgets/auth_link.dart';
import 'widgets/auth_page_heading.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AuthPageHeading(),
            AuthForm(authMode: AuthMode.register),
            const AuthLink(authMode: AuthMode.register),
          ],
        ),
      ),
    );
  }
}
