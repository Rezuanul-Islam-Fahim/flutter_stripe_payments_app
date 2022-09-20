import 'package:flutter/material.dart';

enum AuthMode { login, register }

class AuthHelper {
  static InputDecoration getInputDecoration({
    String? hintText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(30),
      ),
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
    );
  }

  static ButtonStyle get authButtonStyle {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
