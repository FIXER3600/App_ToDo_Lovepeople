import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> listaTarefas = [
  '''limpar a casa Duis voluptate laboris veniam laboris Lorem esse excepteur quis id aute labore quis. Labore irure qui labore quis et duis proident amet officia. Cupidatat eu aliqua veniam ea mollit qui elit enim occaecat.''',
  '''pintar a casa Consectetur pariatur labore in nulla nulla Lorem cillum aliqua irure eu tempor commodo deserunt veniam. Eu occaecat  Do consectetur Lorem laborum tempor est sit aliqua duis mollit magna nostrud. Eu non exercitation esse et exercitation magna.''',
  '''arrumar a casa Sunt culpa dolore dolore proident aliqua. Deserunt .'''
];

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TextEditingController? _textEditingController = TextEditingController();
  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    String tarefa = '';

    setFullScreen();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logo.png',
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
          // TITULO
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Suas Listagens',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          // SEACH BOX
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Busque palavras-chave',
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),

          // caixa de texto

          box(Color.fromRGBO(255, 242, 204, 1), listaTarefas[0]),
          box(Color.fromRGBO(199, 255, 203, 1), listaTarefas[1]),
          box(Color.fromRGBO(232, 197, 255, 1), listaTarefas[1]),

          const SizedBox(
            height: 5,
            width: 5,
          ),

          const Icon(
            Icons.add,
            size: 75,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  Widget box(Color cor, String texto) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          width: 320,
          height: 100,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(texto),
        ),
        const SizedBox(
          height: 15,
          width: 15,
        ),
      ],
    );
  }
}
