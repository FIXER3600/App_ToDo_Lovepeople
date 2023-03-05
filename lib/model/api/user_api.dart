import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  var client = http.Client();

  String name='';
  String email='';
  String password='';
  String baseUrl = 'https://lovepeople-todo.onrender.com/api/';
  Future register() async {
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
}
class SignUpBoolValue {
  bool value = true;
  toggle(signUpBoolValue) {
    value = !value;
  }
}