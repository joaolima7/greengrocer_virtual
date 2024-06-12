import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme_data.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/auth/login_page.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/auth/signup_page.dart';

class GreengrocerApp extends StatelessWidget {
  const GreengrocerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => SignUpPage(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
