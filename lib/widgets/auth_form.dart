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
  bool _passwordHide = true;
  bool _confirmPasswordHide = true;

  void _togglePasswordVisibility() {
    setState(() => _passwordHide = !_passwordHide);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _confirmPasswordHide = !_confirmPasswordHide);
  }

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
          PasswordField(
            hintText: 'Password',
            textInputAction: TextInputAction.next,
            passwordHide: _passwordHide,
            handler: _togglePasswordVisibility,
          ),
          const SizedBox(height: 15),
          if (widget.authMode == AuthMode.register)
            Column(
              children: [
                PasswordField(
                  hintText: 'Confirm Password',
                  textInputAction: TextInputAction.done,
                  passwordHide: _confirmPasswordHide,
                  handler: _toggleConfirmPasswordVisibility,
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

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.hintText,
    this.textInputAction,
    this.passwordHide,
    this.handler,
  });

  final String? hintText;
  final TextInputAction? textInputAction;
  final bool? passwordHide;
  final Function()? handler;
  // bool obscureText = true;

  // void _togglePasswordVisibility() {
  //   setState(() => obscureText = !obscureText);
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: TextFormField(
            decoration: AuthHelper.getInputDecoration(
              hintText: hintText,
              prefixIcon: Icons.key_rounded,
            ),
            obscureText: passwordHide!,
            textInputAction: textInputAction,
            enableSuggestions: false,
            autocorrect: false,
          ),
        ),
        Positioned(
          right: 40,
          top: 3,
          child: IconButton(
            icon: FaIcon(
              passwordHide!
                  ? FontAwesomeIcons.solidEyeSlash
                  : FontAwesomeIcons.solidEye,
              size: 20,
              color: Colors.black54,
            ),
            onPressed: handler!,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
