import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color errorColor = Colors.red[700]!;
  static Color successColor = Colors.green[500]!;

  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.white,
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
            displayMedium: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
    );
  }
}
