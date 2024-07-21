import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:greengrocer_virtual/src/core/utils/utils_dialogs.dart';
import 'package:greengrocer_virtual/src/layers/domain/entities/user.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/delete_token_session_usecase/delete_token_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_session_usecase/get_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/get_token_session_usecase/get_token_session_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/login_user_usecase/login_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/save_token_session_usecase/save_token_session_usecase.dart';

class AuthController extends GetxController {
  LoginUserUseCase _loginUserUseCase;
  SaveTokenSessionUseCase _saveTokenSessionUseCase;
  DeleteTokenSessionUseCase _deleteTokenSessionUseCase;
  GetTokenSessionUseCase _getTokenSessionUseCase;
  GetSessionUseCase _getSessionUseCase;

  AuthController(
    this._loginUserUseCase,
    this._saveTokenSessionUseCase,
    this._deleteTokenSessionUseCase,
    this._getTokenSessionUseCase,
    this._getSessionUseCase,
  );

  RxBool isLoading = false.obs;
  User user = User(name: '', email: '', phone: 0, cpf: 0, password: '');

  Future<void> validateToken(BuildContext context) async {
    String? token = await _getTokenSessionUseCase('token');

    if (token == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      return;
    }

    User? userToken = await _getSessionUseCase(token);

    if (userToken != null) {
      user = userToken;
      user.token = token;
      saveTokenAnProceed(token, context);
    } else {
      signOut(context);
    }
  }

  void saveTokenAnProceed(String token, BuildContext context) async {
    await _saveTokenSessionUseCase('token', token);
    Navigator.pushNamedAndRemoveUntil(context, '/base', (route) => false);
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading.value = true;

    try {
      var user = await _loginUserUseCase(email, password);
      saveTokenAnProceed(user.token!, context);
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    }

    isLoading.value = false;
  }

  Future<void> signOut(BuildContext context) async {
    isLoading.value = true;
    user = User(name: '', email: '', phone: 0, cpf: 0, password: '');
    await _deleteTokenSessionUseCase('token');
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    isLoading.value = false;
  }
}
