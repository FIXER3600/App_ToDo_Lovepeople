import 'package:app_todo_lovepeople/model/api/todo_api.dart';
import 'package:app_todo_lovepeople/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> listaTarefas = [
  '''limpar a casa Duis voluptate laboris veniam laboris Lorem esse excepteur quis id aute labore quis. Labore irure qui labore quis et duis proident amet officia. Cupidatat eu aliqua veniam ea mollit qui elit enim occaecat.''',
  '''pintar a casa Consectetur pariatur labore in nulla nulla Lorem cillum aliqua irure eu tempor commodo deserunt veniam. Eu occaecat  Do consectetur Lorem laborum tempor est sit aliqua duis mollit magna nostrud. Eu non exercitation esse et exercitation magna.''',
  '''arrumar a casa Sunt culpa dolore dolore proident aliqua. Deserunt .''',
  'TESTE'
];

List<Todo> todoList = <Todo>[];

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TextEditingController? _textEditingController = TextEditingController();
  TodoPresenter todoPresenter = TodoPresenter();
  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  void initState() {
    super.initState();
    todoPresenter.getList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String tarefa = '';

    setFullScreen();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: Column(
        children: [
          // LOGO
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                width: size.width * 0.2,
                height: size.width * 0.2,
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
          // TITULO
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Suas Listagens',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          // SEACH BOX

          searchBox(),

          // caixa de texto
          /* Column(
            children: [
              box(const Color.fromRGBO(255, 242, 204, 1), listaTarefas[0]),
              box(const Color.fromRGBO(199, 255, 203, 1), listaTarefas[1]),
              box(const Color.fromRGBO(232, 197, 255, 1), listaTarefas[2]),
              box(const Color.fromRGBO(232, 197, 255, 1), listaTarefas[2]),
              box(const Color.fromRGBO(232, 197, 255, 1), listaTarefas[2]),
            ],
          ), */
          // ListView.builder(
          //   itemCount: 1,
          //   itemBuilder: (BuildContext context, int index) {
          //     return box(todoList[index].attributes.color);
          //   },
          // ),

          Align(
            //d
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('todo_register');
              },
              child: const Icon(
                Icons.add,
                size: 75,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget box(String cor, String texto) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.94,
          height: 100,
          decoration: BoxDecoration(
            // color: Color(0xff.$cor),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Text(texto),
              Padding(padding: EdgeInsets.all(8)),
              Icon(Icons.delete)
            ],
          ),
        ),
        const SizedBox(
          height: 15,
          //width: 15,
        ),
      ],
    );
  }

  Widget searchBox() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.94,
      padding: const EdgeInsets.only(top: 30, bottom: 15),
      child: const TextField(
        decoration: InputDecoration(
            labelText: 'Busque palavras-chave',
            suffixIcon: Icon(Icons.search),
            enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            filled: true,
            fillColor: Colors.white),
      ),
    );
  }
}
