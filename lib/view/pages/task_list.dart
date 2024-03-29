import 'package:app_todo_lovepeople/presenter/todo_list_presenter.dart';
import 'package:app_todo_lovepeople/view/pages/todo_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/box.dart';
import '../widgets/searchBox.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final TextEditingController _textEditingController = TextEditingController();

  setFullScreen() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  void initState() {
    super.initState();
    context.read<TodoPresenter>().getTODOlist();
    //todoPresenter.getTODOlist();
    //var item =  TodoPresenter(TodoApi()).todoList;
  }

  @override
  Widget build(BuildContext context) {
    context.read<TodoPresenter>;
    final size = MediaQuery.of(context).size;

    setFullScreen();

    return Consumer<TodoPresenter>(
      builder: (context, controller, child) {
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
                searchBox(context, controller),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.todoList.length,
                    itemBuilder: (context, index) {
                      var item = controller.todoList[index];

                      return Box(
                        item.attributes?.color ?? '',
                        item.attributes?.title ?? '',
                        item.attributes?.description ?? '',
                        item.id ?? 0,
                        context,
                        controller,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const TodoRegister(),
                      ),
                      (route) => false,
                    );
                    // Navigator.pushNamedAndRemoveUntil(
                    //     context, 'todo_register', (route) => false);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 75,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// Color _getColor(String color) {
//   try {
//     String c = color.replaceAll('#', '');
//     return Color(0xFF + int.parse(c));
//   } catch (e) {
//     print(e);
//     return Colors.white;
//   }
// }
