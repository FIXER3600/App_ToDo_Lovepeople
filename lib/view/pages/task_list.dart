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
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color.fromRGBO(169, 1, 247, 1),
      body: Container(
        padding: const EdgeInsets.all(3),
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(80),
          ),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/images/logo.png',
                scale: 9,
              ),
            ),
            const Text(
              'Suas listagens',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
