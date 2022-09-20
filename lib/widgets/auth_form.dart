import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.hintText,
    this.textInputAction,
  });

  final String? hintText;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  void _togglePasswordVisibility() {
    setState(() => obscureText = !obscureText);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: TextFormField(
            decoration: AuthHelper.getInputDecoration(
              hintText: widget.hintText,
              prefixIcon: Icons.key_rounded,
            ),
            obscureText: obscureText,
            textInputAction: widget.textInputAction,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
        Positioned(
          right: 40,
          top: 3,
          child: IconButton(
            icon: FaIcon(
              obscureText
                  ? FontAwesomeIcons.solidEyeSlash
                  : FontAwesomeIcons.solidEye,
              size: 20,
              color: Colors.black54,
            ),
            onPressed: _togglePasswordVisibility,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
