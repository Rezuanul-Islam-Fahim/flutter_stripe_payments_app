import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, this.authMode});

  final AuthMode? authMode;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
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
              textInputAction: TextInputAction.done,
              autocorrect: false,
            ),
          ),
          const SizedBox(height: 15),
          const PasswordField(hintText: 'Password'),
          const SizedBox(height: 15),
          if (authMode == AuthMode.register)
            Column(
              children: const [
                PasswordField(hintText: 'Confirm Password'),
                SizedBox(height: 15),
              ],
            ),
          ElevatedButton(
            style: AuthHelper.authButtonStyle,
            child: Text(
              authMode == AuthMode.login ? 'Login Now' : 'Create Account',
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.hintText,
  });

  final String? hintText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() => _obscureText = !_obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        decoration: AuthHelper.getInputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icons.key_rounded,
        ).copyWith(
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        obscureText: _obscureText,
        textInputAction: TextInputAction.done,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }
}
