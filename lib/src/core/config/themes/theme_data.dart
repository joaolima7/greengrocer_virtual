import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer_virtual/src/core/config/themes/font_theme.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      textTheme: customTextTheme(ThemeData.dark().textTheme),
      colorScheme: MaterialTheme.darkScheme(),
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
    );

ThemeData get darkMediumConstrastTheme => ThemeData();

ThemeData get darkHightConstrastTheme => ThemeData();

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      textTheme: customTextTheme(ThemeData.light().textTheme),
      colorScheme: MaterialTheme.lightScheme(),
      scaffoldBackgroundColor: Colors.white70,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: MaterialTheme.lightScheme().primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: MaterialTheme.lightScheme().inversePrimary,
        foregroundColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(MaterialTheme.lightScheme().primary),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: MaterialTheme.lightScheme().primary,
            width: 2,
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MaterialTheme.lightScheme().primary,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MaterialTheme.lightScheme().inversePrimary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconColor: MaterialStateProperty.all(
            MaterialTheme.lightScheme().primary,
          ),
        ),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: MaterialTheme.lightScheme().error,
        textColor: Colors.white,
      ),
    );

ThemeData get lightMediumConstrastTheme => ThemeData();

ThemeData get lightHightConstrastTheme => ThemeData();
