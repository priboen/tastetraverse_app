import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 25,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              "https://www.logoku.com/image/data/items/1696220575_logokucom_healthy-food-logo.jpg"),
          radius: 80,
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "Teman Kulineran Kamu",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
