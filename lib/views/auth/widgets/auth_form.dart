import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../helpers/auth_helper.dart';

class AuthForm extends StatelessWidget {
  AuthForm({super.key, this.authMode});

  final AuthMode? authMode;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  Future<void> authenticate() async {
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
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
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                } else if (!EmailValidator.validate(value)) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),
          ),
          const SizedBox(height: 18),
          PasswordField(
            hintText: 'Password',
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 6) {
                return 'Password should be at least 6 characters';
              }

              return null;
            },
            controller: passwordController,
          ),
          const SizedBox(height: 18),
          if (authMode == AuthMode.register)
            Column(
              children: [
                PasswordField(
                  hintText: 'Confirm Password',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    } else if (value != passwordController.text) {
                      return 'Password doesn\'t matched';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 18),
              ],
            ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: ElevatedButton(
                style: AuthHelper.getAuthButtonStyle(context),
                onPressed: authenticate,
                child: Text(
                  authMode == AuthMode.login ? 'Login Now' : 'Create Account',
                ),
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
    this.validator,
    this.controller,
  });

  final String? hintText;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;

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
        controller: widget.controller,
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
        validator: widget.validator,
      ),
    );
  }
}
