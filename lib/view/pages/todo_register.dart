// ignore_for_file: equal_elements_in_set//

import 'package:app_todo_lovepeople/model/api/todo_api.dart';
import 'package:app_todo_lovepeople/presenter/todo_list_presenter.dart';
import 'package:app_todo_lovepeople/presenter/todo_register_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//
class TodoRegister extends StatefulWidget {
  const TodoRegister({super.key});

  @override
  State<TodoRegister> createState() => _TodoRegisterState();
}

class _TodoRegisterState extends State<TodoRegister> {
  final TextEditingController titulotarefa = TextEditingController();
  final TextEditingController descricaotarefa = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoRegisterPresenter>(
        builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
              Padding(
                padding: const EdgeInsets.only(left: 42.0, right: 42.0),
                child: TextFormField(
                  controller: titulotarefa,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Título da Tarefa",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42.0, right: 42.0),
                child: TextFormField(
                  controller: descricaotarefa,
                  keyboardType: TextInputType.multiline,
                  maxLines: 13,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Escreva uma descrição para sua tarefa.",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 48.0,
                  right: 48.0,
                ),
                child: Container(
                  margin: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    height: 43,
                    width: 350,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        InkWell(
                          onTap: () {
                            controller.changeColor('0xFFFFF2CC');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF2CC),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor('0XFFFFD9F0');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0XFFFFD9F0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor('0XFFE8C5FF');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0XFFE8C5FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor('0XFFCAFBFF');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0XFFCAFBFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            controller.changeColor('0XFFE3FFE6');
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0XFFE3FFE6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                InkWell(
                  onTap: () {
                    //Navigator.pop(context, true);
                    Navigator.popAndPushNamed(context, 'todo_list');
                  },
                  child: const Icon(
                    Icons.clear_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      controller.register(
                        titulotarefa.text,
                        descricaotarefa.text,
                        success: () {
                          //Navigator.pop(context, true);
                          Navigator.popAndPushNamed(context, 'todo_list');
                          //Navigator.
                        },
                      );
                    }
                  },
                  child: const Icon(
                    Icons.check_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ]),
            ]),
          ),
        ),
      );
    });
  }
}
