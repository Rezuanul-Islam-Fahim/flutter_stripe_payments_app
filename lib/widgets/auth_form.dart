import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, this.authMode});

  final AuthMode? authMode;

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
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
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
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
          ),
          const SizedBox(height: 15),
          if (widget.authMode == AuthMode.register)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextFormField(
                    decoration: AuthHelper.getInputDecoration(
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.key_rounded,
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ElevatedButton(
            style: AuthHelper.authButtonStyle,
            child: Text(
              widget.authMode == AuthMode.login
                  ? 'Login Now'
                  : 'Create Account',
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
