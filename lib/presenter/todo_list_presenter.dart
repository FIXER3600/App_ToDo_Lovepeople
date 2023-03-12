import 'package:app_todo_lovepeople/model/todo.dart';
import 'package:flutter/material.dart';

import 'package:app_todo_lovepeople/model/api/todo_api.dart';

class TodoPresenter extends ChangeNotifier {
  final TodoApi todoApi;
  List<Todo> todoList = [];

  TodoPresenter(this.todoApi);

  void getTODOlist() {
    todoApi.getList().then((value) {
      todoList = value;
      notifyListeners();
    });
  }

  void delete(String id, {VoidCallback? sucess}) {
    todoApi.delete(id).then((value) => (value) {
          if (value) {
            sucess?.call();
            print('deletada com sucesso');
            getTODOlist();
          }
        });
  }
}
