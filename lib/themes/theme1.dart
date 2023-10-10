import 'package:flutter/material.dart';

class AppTheme {
  /// Dark theme
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent, foregroundColor: Colors.white),
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.white,
          onPrimary: Colors.green,
          secondary: Colors.purple,
          onSecondary: Colors.red,
          error: Colors.grey,
          onError: Colors.black,
          background: Colors.pink,
          onBackground: Colors.teal,
          surface: Colors.amber,
          onSurface: Colors.tealAccent));

  /// Other themes to be implement.
}
