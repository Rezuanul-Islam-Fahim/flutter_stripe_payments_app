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
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 140),
                AuthPageHeading(),
                AuthForm(authMode: AuthMode.login),
                Spacer(),
                AuthLink(authMode: AuthMode.login),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
