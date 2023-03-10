import 'package:app_todo_lovepeople/model/api/todo_api.dart';
import 'package:flutter/material.dart';

class TodoRegisterPresenter extends ChangeNotifier {
  final TodoApi todoApi;

  String colorSelected = '';

  TodoRegisterPresenter(this.todoApi);

  void changeColor(String newColor) {
    colorSelected = newColor;
    notifyListeners();
  }

  void register(String title, String description, {VoidCallback? success}) {
    todoApi.registerTodo(title, description, colorSelected).then((created) {
      if (created) {
        success?.call();
      }
    });
  }

  void cancelaregister() {}
}
