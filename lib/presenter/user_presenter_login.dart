import 'package:flutter/material.dart';

import '../model/api/user_api.dart';

class UserPresenterLogin extends ChangeNotifier {
  final UserApi userApi;
  UserPresenterLogin(this.userApi);

  Future login(String email, String senha) async {
    String? response = await userApi.login(email, senha);
    notifyListeners();
    return response;
  }
}
