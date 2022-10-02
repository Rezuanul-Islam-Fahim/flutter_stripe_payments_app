import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key, this.authMode});

  final AuthMode? authMode;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final FocusNode confirmPasswordNode = FocusNode();

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
              textInputAction: TextInputAction.next,
              autocorrect: false,
            ),
          ),
          const SizedBox(height: 15),
          PasswordField(
            hintText: 'Password',
            textInputAction: TextInputAction.next,
            requestFocus: confirmPasswordNode,
          ),
          const SizedBox(height: 15),
          if (authMode == AuthMode.register)
            Column(
              children: [
                PasswordField(
                  hintText: 'Confirm Password',
                  textInputAction: TextInputAction.next,
                  focusNode: confirmPasswordNode,
                ),
                const SizedBox(height: 15),
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
    this.textInputAction,
    this.focusNode,
    this.requestFocus,
  });

  final String? hintText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final FocusNode? requestFocus;

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
        textInputAction: widget.textInputAction,
        enableSuggestions: false,
        autocorrect: false,
        focusNode: widget.focusNode,
        onFieldSubmitted: (_) {
          if (widget.requestFocus != null) {
            FocusScope.of(context).requestFocus(widget.requestFocus);
          }
        },
      ),
    );
  }
}
