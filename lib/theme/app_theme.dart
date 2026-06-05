import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFF2D2D);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF111111);
  static const Color textSecondary = Color(0xFF888888);
  static const Color textTertiary = Color(0xFF777777);
  static const Color greyLight = Color(0xFFEFEFEF);
  static const Color greySearch = Color(0xFFECECEC);
  static const Color greyTabs = Color(0xFFEBEBEB);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: backgroundColor,
      ),
    );
  }
}
