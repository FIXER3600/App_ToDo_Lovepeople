import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    List<String> listaTarefas = [
      'Correr todos dias',
      'treinar na academia três vezes na semana',
      'ir ao ingles aos sabados',
      'estudar todos dias'
    ];
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
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),

          SizedBox(
            height: 50,
            width: 50,
          ),
          ListView.builder(
            itemCount: listaTarefas.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(textAlign: TextAlign.center, listaTarefas[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
