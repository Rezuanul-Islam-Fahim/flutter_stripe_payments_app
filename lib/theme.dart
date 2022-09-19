import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData get theme {
  return ThemeData(
    primarySwatch: Colors.indigo,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    // navigationBarTheme:
  );
}
