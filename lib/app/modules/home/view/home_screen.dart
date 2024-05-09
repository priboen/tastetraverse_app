import 'package:flutter/material.dart';
import 'package:tastetraverse_app/api/controller/kuliner_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final KulinerController _kulinerController = KulinerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TasteTraverse'),
      ),
    );
  }
}
