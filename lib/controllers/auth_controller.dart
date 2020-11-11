import 'package:flutter/material.dart';
import 'package:loyalty/ropositories/authentication_repository.dart';
import 'package:loyalty/shared/SessionVariables.dart';
import 'package:loyalty/shared/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  @observable
  bool obscure = true;
  @observable
  bool loading = false;

  AuthenticationRepository auth = AuthenticationRepository();

  @action
  login(email, password, context) async {
    loading = true;
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {"email": email, "password": password};
    dynamic res = await auth.login(data);
    loading = false;
    if (res == null) {
      Utils.showMessage('User not found!', context);
      return;
    }
    if (res['token'] != null && res['token'].toString().isNotEmpty) {
      prefs.setString('token', res['token']);
      SessionVariables.user = res['user'];
      Navigator.pushNamedAndRemoveUntil(context, '/tabs', (route) => false);
    } else {
      Utils.showMessage('User not found!', context);
    }
  }

  signup(name, email, role, password, context) async {
    loading = true;
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "role": role,
      "password": password,
      "passwordConfirm": password
    };
    dynamic res = await auth.signup(data);
    loading = false;
    if (res == null) {
      Utils.showMessage('User not found!', context);
      return;
    }
    if (res['token'] != null && res['token'].toString().isNotEmpty) {
      prefs.setString('token', res['token']);
      Navigator.pushNamedAndRemoveUntil(context, '/tabs', (route) => false);
    } else {
      Utils.showMessage('Something went wrong when adding the user!', context);
    }
  }

  @action
  changeObscure() => obscure = !obscure;
}
