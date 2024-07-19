import 'package:flutter/material.dart';
import 'package:greengrocer_virtual/greengrocer_app.dart';
import 'package:greengrocer_virtual/src/core/inject/inject.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();
  runApp(
    const GreengrocerApp(),
  );
}
