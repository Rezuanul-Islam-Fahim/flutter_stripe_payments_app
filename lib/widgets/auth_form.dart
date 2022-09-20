import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextFormField(
              decoration: AuthHelper.getInputDecoration(
                hintText: 'Email',
                prefixIcon: Icons.email_rounded,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: TextFormField(
              decoration: AuthHelper.getInputDecoration(
                hintText: 'Password',
                prefixIcon: Icons.key_rounded,
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: AuthHelper.authButtonStyle,
            child: const Text('Login Now'),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
