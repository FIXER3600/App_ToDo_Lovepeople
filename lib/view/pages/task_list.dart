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
    setFullScreen();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(169, 1, 247, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'assets/images/logo.png',
                      scale: 9,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('data'),
                    TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
