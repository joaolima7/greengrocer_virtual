import 'package:flutter/material.dart';

TextTheme customTextTheme(TextTheme base) {
  return base.copyWith(
    displayLarge: base.displayLarge?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    displayMedium: base.displayMedium?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    displaySmall: base.displaySmall?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    titleLarge: base.titleLarge?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    titleMedium: base.titleMedium?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    titleSmall: base.titleSmall?.copyWith(
      fontFamily: 'Akshar',
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
    ),
    bodyLarge: base.bodyLarge?.copyWith(
      fontFamily: 'AnekDevanagari',
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      fontFamily: 'AnekDevanagari',
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
    ),
    bodySmall: base.bodySmall?.copyWith(
      fontFamily: 'AnekDevanagari',
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
    ),
    labelLarge: base.labelLarge?.copyWith(
      fontFamily: 'AnekDevanagari',
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
    labelSmall: base.labelSmall?.copyWith(
      fontFamily: 'AnekDevanagari',
      fontWeight: FontWeight.normal,
      letterSpacing: 1.5,
    ),
  );
}
