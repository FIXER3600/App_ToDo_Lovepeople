import 'package:app_todo_lovepeople/model/api/user_api.dart';
import 'package:flutter/material.dart';

class UserPresenter extends ChangeNotifier {
  final UserApi _userApi;
  UserPresenter(this._userApi);

  Future<String?> registerUser(String nome, String email, String senha) async {
    Future<String?> token = _userApi.register(nome, email, senha);

    notifyListeners();
    return token;
  }
}
