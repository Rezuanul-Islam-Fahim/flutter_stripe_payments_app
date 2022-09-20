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
              autocorrect: false,
            ),
          ),
          const SizedBox(height: 15),
          const PasswordField(
            hintText: 'Password',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          if (widget.authMode == AuthMode.register)
            Column(
              children: const [
                PasswordField(
                  hintText: 'Confirm Password',
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 15),
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

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.hintText,
    this.textInputAction,
  });

  final String? hintText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        decoration: AuthHelper.getInputDecoration(
          hintText: hintText,
          prefixIcon: Icons.key_rounded,
        ),
        obscureText: true,
        textInputAction: textInputAction,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }
}
