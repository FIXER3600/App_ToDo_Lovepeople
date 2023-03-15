import 'package:app_todo_lovepeople/presenter/todo_list_presenter.dart';
import 'package:flutter/material.dart';

Widget searchBox(BuildContext context, TodoPresenter controller) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.94,
    padding: const EdgeInsets.only(top: 30, bottom: 15),
    child: TextFormField(
      decoration: const InputDecoration(
          labelText: 'Busque palavras-chave',
          suffixIcon: Icon(
            Icons.search,
            size: 40,
          ),
          enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          filled: true,
          fillColor: Colors.white),
      onChanged: (value) {
        controller.inputText(value);
      },
    ),
  );
}
