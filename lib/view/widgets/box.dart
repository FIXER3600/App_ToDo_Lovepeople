import 'package:flutter/material.dart';

Widget box(String cor, String titulo, String descricao, BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          width: size.width * 0.94,
          height: size.height * 0.20,
          decoration: BoxDecoration(
            color: Color(int.parse(cor)),
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color:
                                            Color.fromARGB(255, 107, 4, 125))),
                                const Text('"******" será removida a lixeira',
                                    style:TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 107, 4, 125))),
                                const SizedBox(height: 22),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                        // todoPresenter.delete(
                                        //   item.id?.toString() ?? '',
                                        // );
                                        return print('confirmar');
                                      },
                                      child: GestureDetector(
                                        child: const Text('Confirmar',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 107, 4, 125))),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    GestureDetector(
                                      onTap: () {
                                        print('Cancelar');
                                      },
                                      child: const Text('Cancelar',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 153, 98, 162))),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: const Icon(Icons.delete,
                      size: 30,),
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
        ),
        const SizedBox(
          height: 15,
          //width: 15,
        ),
      ],
    );
  }