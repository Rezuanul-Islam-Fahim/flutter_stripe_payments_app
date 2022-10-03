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
          const SizedBox(height: 30),
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
          const SizedBox(height: 18),
          const PasswordField(hintText: 'Password'),
          const SizedBox(height: 18),
          if (authMode == AuthMode.register)
            Column(
              children: const [
                PasswordField(hintText: 'Confirm Password'),
                SizedBox(height: 18),
              ],
            ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                style: AuthHelper.getAuthButtonStyle(context),
                child: Text(
                  authMode == AuthMode.login ? 'Login Now' : 'Create Account',
                ),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 20),
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
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
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
