import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

class AuthLink extends StatelessWidget {
  const AuthLink({super.key, this.authMode});

  final AuthMode? authMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(
          authMode == AuthMode.login ? RegisterScreen.route : LoginScreen.route,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            authMode == AuthMode.login
                ? 'Don\'t have an account? '
                : 'Already have an account? ',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            authMode == AuthMode.login ? 'Register Here' : 'Login here',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}