import 'package:app_todo_lovepeople/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:app_todo_lovepeople/model/api/todo_api.dart';

class TodoPresenter extends ChangeNotifier {
  final TodoApi todoApi;
  List<Todo> todoList = [];
  List<Todo> _list = [];

  TodoPresenter(this.todoApi);

  void getTODOlist() {
    todoApi.getList().then((value) {
      todoList = value;
      _list = value;
      notifyListeners();
    });
  }

  void delete(String id, void todolist, {VoidCallback? sucess}) {
    todoApi.delete(id).then((value) => (value) {
          if (value) {
            sucess?.call();
            print('deletada com sucesso');

            getTODOlist();
            notifyListeners();
          }
        });
  }

  void inputText(String value) {
    todoList = _list
        .where((element) =>
            element.attributes?.title
                ?.toLowerCase()
                .contains(value.toLowerCase()) ??
            false)
        .toList();
    notifyListeners();
  }
}
