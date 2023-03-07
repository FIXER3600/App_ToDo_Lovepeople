// ignore_for_file: equal_elements_in_set

import 'package:app_todo_lovepeople/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoRegister extends StatefulWidget {
  const TodoRegister({super.key});

  @override
  State<TodoRegister> createState() => _TodoRegisterState();
}

class _TodoRegisterState extends State<TodoRegister> {
  final TextEditingController titulotarefa = TextEditingController();
  final TextEditingController descricaotarefa = TextEditingController();

  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    setFullScreen();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'lib/view/assets/images/logo.png',
                    scale: 9,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
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
            obscure: false,
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
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(30),

                    

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
                  _constroibotao('', color: const Color(0xFFFFF2CC)),
                  _constroibotao('', color: const Color(0XFFFFD9F0)),
                  _constroibotao('', color: const Color(0XFFE8C5FF)),
                  _constroibotao('', color: const Color(0XFFCAFBFF)),
                  _constroibotao('', color: const Color(0XFFE3FFE6)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.clear_rounded,
                  size: 80,
                  color: Colors.white,
                ),
                Icon(
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
      child: const Text(""),
    ),
  );
}

//GestureDetector(
         // onTap: () {
           // Navigator.of(context).popAndPushNamed('\task_list');
          //},
