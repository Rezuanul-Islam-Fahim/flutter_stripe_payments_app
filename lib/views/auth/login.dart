import 'package:flutter/material.dart';

import '../../core/widgets/unfocus_scope.dart';
import 'helpers/auth_helper.dart';
import 'widgets/auth_form.dart';
import 'widgets/auth_link.dart';
import 'widgets/auth_page_heading.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return UnfocusScope(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AuthPageHeading(),
              AuthForm(authMode: AuthMode.login),
              AuthLink(authMode: AuthMode.login),
            ],
          ),
        ),
      ),
    );
  }
}
