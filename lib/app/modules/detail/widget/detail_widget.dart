import 'package:flutter/material.dart';

class TextDetailWidget extends StatelessWidget {
  TextDetailWidget(
      {super.key,
      required this.textWidget,
      required this.ukuranBox,
      required this.styleParam});
  final String textWidget;
  final double ukuranBox;
  final TextStyle styleParam;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: ukuranBox),
      Text(
        textWidget,
        style: styleParam,
      ),
    ]);
  }
}
