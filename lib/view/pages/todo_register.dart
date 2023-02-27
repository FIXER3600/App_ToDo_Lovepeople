import 'package:app_todo_lovepeople/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/services.dart';

class TodoRegister extends StatefulWidget {
  const TodoRegister({super.key});

  @override
  State<TodoRegister> createState() => _TodoRegisterState();
}

class _TodoRegisterState extends State<TodoRegister> {
  final TextEditingController titulotarefa = TextEditingController();
  final TextEditingController descricaotarefa = TextEditingController();

  //setFullScreen() {
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
  //overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  //}

  @override
  Widget build(BuildContext context) {
    //setFullScreen();

    double left;
    double top;
    double right;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'lib/view/assets/images/logo.png',
                    scale: 9,
                  ),
                ),
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nova Tarefa',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Textformfield(
            controller: titulotarefa,
            message: '',
            label: 'Título da Tarefa',
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42.0, right: 42.0),
            child: TextField(
              controller: descricaotarefa,
              keyboardType: TextInputType.multiline,
              maxLines: 13,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Escreva uma descrição para sua tarefa.",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _constroibotao('', color: Color(0xFFFFF2CC)),
                  _constroibotao('', color: Color(0XFFFFD9F0)),
                  _constroibotao('', color: Color(0XFFE8C5FF)),
                  _constroibotao('', color: Color(0XFFCAFBFF)),
                  _constroibotao('', color: Color(0XFFE3FFE6)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            const Icon(
              Icons.clear_rounded,
              size: 80,
              color: Colors.white,
            ),
            const Icon(
              Icons.check_rounded,
              size: 80,
              color: Colors.white,
            ),
          ]),
        ]),
      ),
    );
  }
}

Widget _constroibotao(String text, {Color color = Colors.grey}) {
  return SizedBox(
    width: 40,
    height: 60,
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(""),
    ),
  );
}

//GestureDetector(
         // onTap: () {
           // Navigator.of(context).popAndPushNamed('\task_list');
          //},
