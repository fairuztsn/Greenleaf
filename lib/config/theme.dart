import 'package:flutter/material.dart';
import 'package:greenleaf/config/app_colors.dart';

/// Default [ThemeData] for Example
class AppTheme {
  /// Default constructor for Example [ThemeData]
  AppTheme();

  /// Exposes theme data to MaterialApp
  ThemeData get themeData {
    return ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: _colorScheme,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        bodyMedium: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        bodySmall: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        displayLarge: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        displayMedium: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        displaySmall: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        headlineLarge: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        headlineMedium: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        headlineSmall: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        labelLarge: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        labelMedium: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        labelSmall: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        titleLarge: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        titleMedium: TextStyle(fontFamily: 'Mulish', color: Colors.black),
        titleSmall: TextStyle(fontFamily: 'Mulish', color: Colors.black),
      ),
    );
  }

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.colorGreenLeaf,
      );
}
