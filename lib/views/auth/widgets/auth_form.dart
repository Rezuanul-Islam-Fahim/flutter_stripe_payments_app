import 'package:another_flushbar/flushbar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../services/auth_service.dart';
import '../../home/home.dart';
import '../helpers/auth_exception_handler.dart';
import '../helpers/auth_helper.dart';
import '../../../models/auth_result.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, this.authMode});

  final AuthMode? authMode;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  String _email = '';
  String _username = '';
  bool isLoggingIn = false;

  Future<void> authenticate(BuildContext context) async {
    AuthStatus? status;

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoggingIn = true;
      });

      _formKey.currentState!.save();

      if (kDebugMode) {
        print('*********** Login Credentials ***********');
        print(_username);
        print(_email);
        print(_passwordController.text);
        print('== ************** == ************** ==');
      }

      if (widget.authMode == AuthMode.login) {
        status = await _authService.login(
          email: _email,
          password: _passwordController.text,
        );
      } else {
        status = await _authService.createAccount(
          username: _username,
          email: _email,
          password: _passwordController.text,
        );
      }

      setState(() {
        isLoggingIn = false;
      });

      if (!mounted) return;

      AuthResult authResult = AuthExceptionHandler.getAuthResult(status);

      if (status == AuthStatus.loginSuccess ||
          status == AuthStatus.registerSuccess) {
        Navigator.of(context).pushReplacementNamed(Home.route);
      }

      Flushbar(
        title: authResult.title,
        message: authResult.content,
        duration: const Duration(seconds: 3),
        leftBarIndicatorColor: status != AuthStatus.loginSuccess &&
                status != AuthStatus.registerSuccess
            ? AppTheme.errorColor
            : AppTheme.successColor,
        margin: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(10),
        flushbarStyle: FlushbarStyle.FLOATING,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          if (widget.authMode == AuthMode.register)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: TextFormField(
                    decoration: AuthHelper.getInputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icons.person,
                    ),
                    textInputAction: TextInputAction.done,
                    autocorrect: true,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter a username';
                      }

                      return null;
                    },
                    onSaved: (String? value) => _username = value!,
                  ),
                ),
                const SizedBox(height: 18),
              ],
            ),
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
              onSaved: (String? value) => _email = value!,
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
            controller: _passwordController,
          ),
          const SizedBox(height: 18),
          if (widget.authMode == AuthMode.register)
            Column(
              children: [
                PasswordField(
                  hintText: 'Confirm Password',
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 6) {
                      return 'Password should be at least 6 characters';
                    } else if (value != _passwordController.text) {
                      return 'Password doesn\'t matched';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 18),
              ],
            ),
          _buildAuthenticateButton(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAuthenticateButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: !isLoggingIn
                ? const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 25,
                  )
                : const EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 25,
                  ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: Theme.of(context).textTheme.titleSmall,
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          onPressed: !isLoggingIn ? () => authenticate(context) : () {},
          child: !isLoggingIn
              ? Text(
                  widget.authMode == AuthMode.login
                      ? 'Login Now'
                      : 'Create Account',
                )
              : const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.4,
                  ),
                ),
        ),
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
