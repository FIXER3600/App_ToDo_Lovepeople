import 'package:flutter/material.dart';

import '../../presenter/todo_list_presenter.dart';

Widget Box(String cor, String titulo, String descricao, int? id,
    BuildContext context, TodoPresenter controller) {
  final size = MediaQuery.of(context).size;

  Color? color;

  try {
    color = Color(int.parse(cor));
  } catch (e) {
    color = Colors.white;
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    padding: const EdgeInsets.all(6.0),
    width: size.width * 0.94,
    height: size.height * 0.20,
    decoration: BoxDecoration(
      color: color,
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: SizedBox(
                      height: size.height * 0.2,
                      width: size.width * 1.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Deseja deletar este item?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 107, 4, 125),
                            ),
                          ),
                          Text(
                            '"$titulo" será removida a lixeira',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color.fromARGB(255, 107, 4, 125),
                            ),
                          ),
                          const SizedBox(height: 22),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  controller.delete(
                                    id.toString(),
                                  );
                                },
                                child: GestureDetector(
                                  child: const Text(
                                    'Confirmar',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Color.fromARGB(
                                        255,
                                        107,
                                        4,
                                        125,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 153, 98, 162),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                child: const Icon(
                  Icons.delete,
                  size: 30,
                ),
              ),
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
  );
}
