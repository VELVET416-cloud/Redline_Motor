import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import '../pages/profile_page.dart';

void main() {
  runApp(const RedlineMotorApp());
}

class RedlineMotorApp extends StatelessWidget {
  const RedlineMotorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Redline Motors',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
