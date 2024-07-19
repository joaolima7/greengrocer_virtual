import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greengrocer_virtual/src/core/config/themes/theme.dart';

class UtilsDialogs {
  static void showToast(
      {required String message,
      required double sizeWidth,
      bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      fontSize: sizeWidth * .04,
      textColor: Colors.white,
      backgroundColor:
          isError ? Colors.red : MaterialTheme.lightScheme().inversePrimary,
    );
  }
}
