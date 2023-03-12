import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  var client = http.Client();
  static const String KEY_TOKEN = 'token';

  String name = '';
  String email = '';
  String password = '';
  String baseUrl = 'https://lovepeople-todo.onrender.com/api/';

  Future<String> register() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Uri uri = Uri.parse('${baseUrl}auth/local/register');
    return http.post(
      uri,
      body: {
        "username": name,
        "email": email,
        "password": password,
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        Map json = jsonDecode(value.body);
        await sharedPreferences.setString('jwt', json['jwt']);
        await sharedPreferences.setBool('isAuth', true);
        return json['jwt'];
      } else {
        await sharedPreferences.setBool('isAuth', false);
        return value.body;
      }
    });
  }

  Future<String?> login(String email, String senha) async {
    Uri uri = Uri.parse('${baseUrl}auth/local');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return http.post(
      uri,
      body: {
        "email": email,
        "password": senha,
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        Map json = jsonDecode(value.body);
        await sharedPreferences.setString('jwt', json['jwt']);
        await sharedPreferences.setBool('isAuth', true);
        var token = sharedPreferences.getString('jwt');
        print(token);
        return json['jwt'];
      } else {
        return null;
      }
    });
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(KEY_TOKEN);
  }
}

class SignUpBoolValue {
  bool value = true;
  toggle(signUpBoolValue) {
    value = !value;
  }
}
