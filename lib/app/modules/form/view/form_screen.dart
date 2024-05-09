import 'package:flutter/material.dart';
import 'package:tastetraverse_app/app/modules/form/widget/form_header.dart';
import 'package:tastetraverse_app/app/modules/form/widget/text_field.dart';

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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormHeaderWidget(),
                TextFieldWidget(
                  textcontroller: _namaController,
                  labelParam: 'Nama Kuliner',
                  hintParam: 'Masukan Nama Kuliner',
                  iconParam: Icon(
                    Icons.food_bank,
                  ),
                  inputType: TextInputType.text,
                  messageParam: 'Nama Kuliner tidak boleh kosong!',
                ),
                TextFieldWidget(
                  textcontroller: _jenisController,
                  labelParam: 'Jenis Kuliner',
                  hintParam: 'Masukan Jenis Kuliner',
                  iconParam: Icon(Icons.fastfood),
                  inputType: TextInputType.text,
                  messageParam: 'Jenis Kuliner tidak boleh kosong!',
                ),
                TextFieldWidget(
                  textcontroller: _hargaController,
                  labelParam: 'Harga Kuliner',
                  hintParam: 'Masukan Harga Kuliner',
                  iconParam: Icon(Icons.price_change),
                  inputType: TextInputType.number,
                  messageParam: 'Harga tidak boleh kosong!',
                ),
              ],
            ),
          )),
    );
  }
}
