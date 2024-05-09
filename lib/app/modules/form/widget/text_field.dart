import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.textcontroller,
      required this.labelParam,
      required this.hintParam,
      required this.iconParam,
      required this.inputType,
      required this.messageParam});

  final TextEditingController textcontroller;
  final String labelParam;
  final String hintParam;
  final String messageParam;
  final Icon iconParam;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        controller: textcontroller,
        decoration: InputDecoration(
          labelText: labelParam,
          hintText: hintParam,
          icon: iconParam,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: inputType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return messageParam;
          }
          return null;
        },
      ),
    );
  }
}
