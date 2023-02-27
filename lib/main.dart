import 'package:app_todo_lovepeople/view/pages/login.dart';
import 'package:app_todo_lovepeople/view/pages/task_list.dart';
import 'package:app_todo_lovepeople/view/pages/signup.dart';
import 'package:app_todo_lovepeople/view/pages/signup_succsess.dart';
import 'package:app_todo_lovepeople/view/pages/todo_register.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDo Lovepeople',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login': (context) => const Login(),
          'todo_register': (context) => const TodoRegister(),
          'signup': (context) => const Signup(),
          'succsess': (context) => const SignupSuccsess(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TaskList());
  }
}
