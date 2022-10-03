import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
