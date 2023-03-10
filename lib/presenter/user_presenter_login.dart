import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/api/user_api.dart';

class UserPresenterLogin extends ChangeNotifier {
  final UserApi userApi;

  UserPresenterLogin(this.userApi);

  Future login(
    String email,
    String senha,
  ) {
    return userApi.login(email, senha);
  }
}
