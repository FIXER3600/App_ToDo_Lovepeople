
  import 'package:flutter/material.dart';

Widget searchBox(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: const TextField(
        decoration: InputDecoration(
            labelText: 'Busque palavras-chave',
            suffixIcon: Icon(
              Icons.search,
              size: 40,
            ),
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }

