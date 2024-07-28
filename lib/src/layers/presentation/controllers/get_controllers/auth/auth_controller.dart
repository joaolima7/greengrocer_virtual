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
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signout_user_usecase/signout_user_usecase.dart';
import 'package:greengrocer_virtual/src/layers/domain/usecases/user_usecases/signup_user_usecase/signup_user_usecase.dart';

class AuthController extends GetxController {
  final LoginUserUseCase _loginUserUseCase;
  final SaveTokenSessionUseCase _saveTokenSessionUseCase;
  final DeleteTokenSessionUseCase _deleteTokenSessionUseCase;
  final GetTokenSessionUseCase _getTokenSessionUseCase;
  final GetSessionUseCase _getSessionUseCase;
  final SignUpUserUseCase _signUpUserUseCase;
  final SignOutUserUseCase _signOutUserUseCase;

  AuthController(
    this._loginUserUseCase,
    this._saveTokenSessionUseCase,
    this._deleteTokenSessionUseCase,
    this._getTokenSessionUseCase,
    this._getSessionUseCase,
    this._signOutUserUseCase,
    this._signUpUserUseCase,
  );

  var isLoading = false.obs;
  var user = User.empty().obs;

  Future<void> validateToken(BuildContext context) async {
    String? token = await _getTokenSessionUseCase('token');

    if (token == null) {
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      return;
    }

    User? userToken = await _getSessionUseCase(token);

    if (userToken != null) {
      user.value = userToken;
      user.value.token = token;
      saveTokenAndProceed(token, context);
    } else {
      signOut(context);
    }
  }

  void saveTokenAndProceed(String token, BuildContext context) async {
    await _saveTokenSessionUseCase('token', token);
    Navigator.pushNamedAndRemoveUntil(context, '/base', (route) => false);
  }

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isLoading.value = true;

    try {
      var loggedUser = await _loginUserUseCase(email, password);
      user.value = loggedUser;
      saveTokenAndProceed(loggedUser.token!, context);
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut(BuildContext context) async {
    isLoading.value = true;
    await _deleteTokenSessionUseCase('token');
    await _signOutUserUseCase(user.value.token!);
    user.value = User.empty();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    isLoading.value = false;
  }

  Future<void> signUp(
      {required User newUser, required BuildContext context}) async {
    isLoading.value = true;

    try {
      var createdUser = await _signUpUserUseCase(newUser);
      user.value = createdUser!;
      saveTokenAndProceed(user.value.token!, context);
    } catch (e) {
      UtilsDialogs.showToast(message: e.toString(), sizeWidth: 300);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> recoverPassword() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
  }
}
