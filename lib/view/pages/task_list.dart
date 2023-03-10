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

List<Todo> todoList = <Todo>[
  Todo(
      attributes: Attributes(
          color: '#b7a800', title: 'titulo', description: 'descricao')),
  Todo(
      attributes: Attributes(
          color: '#b7a800', title: 'titulo', description: 'descricao')),
  Todo(
      attributes: Attributes(
          color: '#b7a800', title: 'titulo', description: 'descricao')),
  Todo(
      attributes: Attributes(
          color: '#b7a800', title: 'titulo', description: 'descricao')),
];

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TextEditingController? _textEditingController = TextEditingController();
  TodoPresenter todoPresenter = TodoPresenter();
  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive
    
    
    
    ,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return box(
                      todoList[index].attributes?.color ?? '',
                      todoList[index].attributes?.title ?? '',
                      todoList[index].attributes?.description ?? '');
                },
              ),

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
        ),
      ),
    );
  }

  Widget box(String cor, String titulo, String descricao) {
    String corString = cor.substring(1);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: size.width * 0.94,
          height: 100,
          decoration: BoxDecoration(
            color: Color(int.parse('0xff$corString')),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Text(titulo),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.amber,
                                  ),
                                )),
                        child: const Icon(Icons.delete)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.05, top: size.height * 0.01),
                child: Text(descricao),
              ),
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
