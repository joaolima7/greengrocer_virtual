import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';
import 'package:greengrocer_virtual/src/layers/presentation/controllers/get_controllers/auth/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = GetIt.I.get<AuthController>();

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    await authController.validateToken(context);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen.height,
      width: sizeScreen.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MaterialTheme.lightScheme().primary,
              MaterialTheme.lightScheme().inversePrimary,
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'GreenGrocer',
            style: TextStyle(
              fontSize: sizeScreen.width * .1,
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
          Text(
            'Virtual',
            style: TextStyle(
              fontSize: sizeScreen.width * .07,
              color: MaterialTheme.lightScheme().inverseSurface,
              decoration: TextDecoration.none,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(sizeScreen.width * .05),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
