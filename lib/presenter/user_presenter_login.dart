import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/api/user_api.dart';

class UserPresenterLogin extends ChangeNotifier {
  final UserApi userApi;

  UserPresenterLogin(this.userApi);

  void login(String email, String senha,
      {VoidCallback? sucess, VoidCallback? failure}) {
    userApi.login(email, senha).then((value) async {
      if (value != null) {
        var prefs = await SharedPreferences.getInstance();
        prefs.setString(UserApi.KEY_TOKEN, value);
        sucess?.call();
      }
    }).catchError((e) {
      failure?.call();
    });
  }
}
