import 'package:app_todo_lovepeople/view/pages/task_list.dart';
import 'package:flutter/material.dart';

class SignupSuccsess extends StatelessWidget {
  const SignupSuccsess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFA901F7),
        body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Cadastro concluído!',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Montserrat-SemiBold'),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TaskList()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                            right: 25, left: 25, bottom: 15, top: 15),
                        side: const BorderSide(
                          width: 2.0,
                          color: Colors.white,
                        ),
                        backgroundColor: const Color(0xff3101B9),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)),
                      ),
                      child: const Text(
                        'Começar',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          fontFamily: 'Montserrat-SemiBold',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(250))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/view/assets/images/coruja-image.png',
                      ),
                      const Text('Os ventos da programação estão indo até você',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF3101B9),
                              fontFamily: 'Tahoma')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
