import 'package:app_todo_lovepeople/model/api/user_api.dart';
import 'package:app_todo_lovepeople/presenter/todo_list_presenter.dart';
import 'package:app_todo_lovepeople/presenter/user_presenter.dart';
import 'package:app_todo_lovepeople/presenter/user_presenter_login.dart';
import 'package:app_todo_lovepeople/view/pages/signup.dart';
import 'package:app_todo_lovepeople/view/pages/signup_succsess.dart';
import 'package:app_todo_lovepeople/view/pages/task_list.dart';
import 'package:app_todo_lovepeople/view/pages/todo_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UserApi>(create: (_) => UserApi()),
          Provider<TodoPresenter>(create: (_) => TodoPresenter(context.read())),
          ChangeNotifierProvider(
              create: (context) => UserPresenter(context.read())),
          ChangeNotifierProvider(
            create: (context) => UserPresenterLogin(
              context.read(),
            ),
          ),
        ],
        child: MaterialApp(
            title: 'ToDo Lovepeople',
            debugShowCheckedModeBanner: false,
            initialRoute: 'login',
            routes: {
              'login': (context) => const Login(),
              'todo_register': (context) => const TodoRegister(),
              'signup': (context) => const Signup(),
              'succsess': (context) => const SignupSuccsess(),
              'todo_list': (context) => const TaskList(),
            },
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const TaskList()));
  }
}
