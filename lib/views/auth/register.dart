import 'package:flutter/material.dart';

import '../../core/widgets/unfocus_scope.dart';
import 'helpers/auth_helper.dart';
import 'widgets/auth_form.dart';
import 'widgets/auth_link.dart';
import 'widgets/auth_page_heading.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  static const String route = '/register';

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
                SizedBox(height: 100),
                AuthPageHeading(),
                AuthForm(authMode: AuthMode.register),
                Spacer(),
                AuthLink(authMode: AuthMode.register),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
