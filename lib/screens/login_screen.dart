import 'package:flutter/material.dart';

import '../widgets/auth_form.dart';
import '../widgets/auth_link.dart';
import '../widgets/auth_screen_heading.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AuthScreenHeading(),
            AuthForm(),
            AuthLink(),
          ],
        ),
      ),
    );
  }
}
