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
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: MaterialTheme.lightScheme().inversePrimary,
      foregroundColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MaterialTheme.lightScheme().primary,
      foregroundColor: Colors.white,
    ));

ThemeData get lightMediumConstrastTheme => ThemeData();

ThemeData get lightHightConstrastTheme => ThemeData();
