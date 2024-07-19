import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase.dart';

class AuthController extends GetxController {
  LoginUserUseCase _loginUserUseCase;
  AuthController(this._loginUserUseCase);

  RxBool isLoading = false.obs;

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading.value = true;

    try {
      var user = await _loginUserUseCase(email, password);
      print(user.token);
      Navigator.pushNamedAndRemoveUntil(context, '/base', (route) => false);
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    }

    isLoading.value = false;
  }
}
