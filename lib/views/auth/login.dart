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
              children: [
                const SizedBox(height: 140),
                const AuthPageHeading(),
                const AuthForm(authMode: AuthMode.login),
                _buildForgotPassword(context),
                const Spacer(),
                const AuthLink(authMode: AuthMode.login),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
