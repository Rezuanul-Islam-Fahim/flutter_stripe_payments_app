import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeading(context),
            const SizedBox(height: 25),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      decoration: AuthHelper.getInputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icons.email_rounded,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: TextFormField(
                      decoration: AuthHelper.getInputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icons.key_rounded,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
        text: 'Flutter',
        children: const [
          TextSpan(
            text: ' Stripe',
            style: TextStyle(color: Colors.black87),
          ),
          TextSpan(
            text: ' Payments',
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
