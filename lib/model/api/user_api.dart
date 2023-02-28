import 'dart:convert';

import 'package:http/http.dart' as http;

class UserApi{
  var client = http.Client();
  
  String baseUrl = 'https://lovepeople-todo.onrender.com/api/';
  Future<String?> register(String nome, String email, String senha) {
    Uri uri = Uri.parse('${baseUrl}auth/local/register');
    return http.post(
      uri,
      body: {
        "username": nome,
        "email": email,
        "password": senha,
      },
    ).then((value) {
      if (value.statusCode == 200) {
        Map json = jsonDecode(value.body);
        return json['jwt'];
      } else {
        return value.body;
      }
    });
  }
}