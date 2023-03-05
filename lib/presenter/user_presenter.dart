import 'package:app_todo_lovepeople/model/api/user_api.dart';
import 'package:flutter/material.dart';

class UserPresenter extends ChangeNotifier {
  final UserApi _userApi;
  UserPresenter(this._userApi);
   String errorMessage = '';


  bool isUsernameSignupValid = false;

  bool isPasswordValid = false;

  bool isEmailValid = false;

  bool isSignUpValid = false;

  bool isSignUpButtonLoading = false;

  String confirmPassword = '';

  validateSignUp() {
    validateUsername();
    validateEmail();
    validatePassword();
    if (isEmailValid == true &&
        isUsernameSignupValid == true &&
        isPasswordValid == true) {
      return isSignUpValid = true;
    }
  }

  validatePassword() {
    if (_userApi.password == confirmPassword &&
        confirmPassword.length >= 6 &&
        _userApi.password.length >= 5) {
      return {
        isPasswordValid = true,
      };
    } else {
      return false;
    }
  }

  validateEmail() {
    if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(_userApi.email)) {
      return isEmailValid = true;
    }
  }

  validateUsername() {
    if (_userApi.name.trim().length < 3) return;
    if (_userApi.name.trim().split(' ').length < 2) return;
    if (!RegExp("[a-zA-Z\u00C0-\u00FF]").hasMatch(_userApi.name)) {
      return;
    }
    return {
      isUsernameSignupValid = true,
    };
  }

  setUsername(String value) => _userApi.name = value;

  setNumberEmailCpf(String value) {
    _userApi.email = value;
  }

  setPassword(String value) => _userApi.password = value;

  setConfirmPassword(String value) => confirmPassword = value;

  void toggle(SignUpBoolValue status) {
    status.toggle(status);
    notifyListeners();
  }


  Future registerUser(String nome, String email, String senha) async {
   
      Future response = await _userApi.register();
      notifyListeners();
      return response;
  
  }
}
