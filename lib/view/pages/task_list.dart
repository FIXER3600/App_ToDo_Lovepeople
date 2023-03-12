import 'package:app_todo_lovepeople/model/api/todo_api.dart';
import 'package:app_todo_lovepeople/model/todo.dart';
import 'package:app_todo_lovepeople/presenter/todo_list_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<Todo> todoList = <Todo>[
  Todo(
      attributes: Attributes(
          color: '#FFF2CC',
          title: 'Atividade Fisica',
          description:
              'atividade de caminhar todos os dias, 90 minutos de natação, pedalar 250 km, 180 minuntos de musculação leve')),
  Todo(
      attributes: Attributes(
          color: '#C7FFCB',
          title: 'Faculdade',
          description:
              'Estudar para logica de programação, Orientação a Objeto, banco de dados, Arquiterura de software')),
  Todo(
      attributes: Attributes(
          color: '#FFF2CC',
          title: 'Desenvovimento de Software',
          description:
              'entregar pelo menos um aplicativo por semana na lovepeople')),
  Todo(
      attributes: Attributes(
          color: '#FFF2CC',
          title: 'Desenvovimento de Software',
          description:
              'entregar pelo menos um aplicativo por semana na lovepeople')),
  Todo(
      attributes: Attributes(
          color: '#FFF2CC',
          title: 'Desenvovimento de Software',
          description:
              'entregar pelo menos um aplicativo por semana na lovepeople')),
];

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  TextEditingController? _textEditingController = TextEditingController();
  TodoPresenter todoPresenter = TodoPresenter(TodoApi());
  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  void initState() {
    super.initState();
    todoPresenter.getTODOlist();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String tarefa = '';

    setFullScreen();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: SafeArea(
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

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: axisDirectionToAxis(AxisDirection.down),
                child: SizedBox(
                  height: size.height * 0.9,
                  child: ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return box(
                          todoList[index].attributes?.color ?? '',
                          todoList[index].attributes?.title ?? '',
                          todoList[index].attributes?.description ?? '');
                    },
                  ),
                ),
              ),
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
    );
  }

  Widget box(String cor, String titulo, String descricao) {
    String corString = cor.substring(1);
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          width: size.width * 0.94,
          height: size.height * 0.20,
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
                    padding: EdgeInsets.only(left: size.width * 0.01),
                    child: Text(
                      titulo,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color.fromARGB(255, 107, 4, 125)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.01),
                    child: InkWell(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  content: SizedBox(
                                    height: size.height * 0.1,
                                    width: size.width * 1.0,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text('Deseja deletar este item?',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color.fromARGB(
                                                    255, 107, 4, 125))),
                                        const Text(
                                            '"******" será removida a lixeira',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 107, 4, 125))),
                                        SizedBox(height: 22),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: const [
                                            Text('Confirmar',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 107, 4, 125))),
                                            SizedBox(width: 15),
                                            Text('Cancelar',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 153, 98, 162))),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                        child: const Icon(Icons.delete)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 0.01, top: size.height * 0.001),
                child: Text(
                  descricao,
                  style: const TextStyle(fontSize: 20),
                ),
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
}
