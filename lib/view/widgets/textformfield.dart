import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  final TextEditingController controller;
  final String message;
  final String label;
  final double? height;
  const Textformfield(
      {super.key,
      required this.controller,
      required this.message,
      required this.label,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 310,
          height: 40,
          child: TextFormField(
            controller: controller,
            style: const TextStyle(
                fontSize: 10,
                color: Color(0xff3101B9),
                fontWeight: FontWeight.w600,
                fontFamily: 'Tahoma'),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              labelText: label,
              labelStyle: const TextStyle(
                color: Color(0xff3101B9),
                fontSize: 16,
                fontFamily: "verdana_regular",
                fontWeight: FontWeight.w400,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return message;
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: height,
        ),
      ],
    );
  }
}
