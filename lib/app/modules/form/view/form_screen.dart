import 'package:flutter/material.dart';
import 'package:tastetraverse_app/app/modules/form/widget/form_header.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();
  final _hargaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Masukan Data Kuliner"),
      ),
      body: Form(
          child: SingleChildScrollView(
        child: Column(
          children: [FormHeaderWidget()],
        ),
      )),
    );
  }
}
