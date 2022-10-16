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
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hintText,
      prefixIcon: Icon(prefixIcon),
    );
  }
}
