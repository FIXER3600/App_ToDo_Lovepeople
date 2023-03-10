import 'package:flutter/material.dart';

import 'package:app_todo_lovepeople/model/api/todo_api.dart';

class TodoListPresenter extends ChangeNotifier {
  final TodoApi todoApi;

  TodoListPresenter(this.todoApi);
}
