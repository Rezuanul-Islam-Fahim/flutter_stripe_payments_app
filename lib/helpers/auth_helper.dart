import 'package:flutter/material.dart';

enum AuthMode { login, register }

class AuthHelper {
  static InputDecoration getInputDecoration({
    String? hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 16,
      ),
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8),
      ),
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
    );
  }

  static ButtonStyle getAuthButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: Theme.of(context).textTheme.titleSmall,
      elevation: 0,
      shadowColor: Colors.transparent,
    );
  }
}
