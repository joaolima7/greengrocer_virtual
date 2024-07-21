import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme_data.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/auth/login_page.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/auth/signup_page.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/base/base_screen.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/product/datail_product.dart';
import 'package:greengrocer_virtual/src/layers/presentation/ui/pages/splash/splash_screen.dart';

class GreengrocerApp extends StatelessWidget {
  const GreengrocerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/base': (context) => BaseScreen(),
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
