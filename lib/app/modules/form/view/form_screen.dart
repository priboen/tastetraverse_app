import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tastetraverse_app/api/controller/kuliner_controller.dart';
import 'package:tastetraverse_app/app/data/kuliner.dart';
import 'package:tastetraverse_app/app/modules/form/widget/form_header.dart';
import 'package:tastetraverse_app/app/modules/form/widget/text_field.dart';
import 'package:tastetraverse_app/app/modules/home/view/home_screen.dart';
import 'package:tastetraverse_app/app/modules/map/view/map_screen.dart';

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
  final kulinerController = KulinerController();

  File? _image;
  String? _alamat;
  final _imagePicker = ImagePicker();

  Future<void> getImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
        }
      },
    );
  }

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
                const FormHeaderWidget(),
                TextFieldWidget(
                  textcontroller: _namaController,
                  labelParam: 'Nama Kuliner',
                  hintParam: 'Masukan Nama Kuliner',
                  iconParam: const Icon(
                    Icons.food_bank,
                  ),
                  inputType: TextInputType.text,
                  messageParam: 'Nama Kuliner tidak boleh kosong!',
                ),
                TextFieldWidget(
                  textcontroller: _jenisController,
                  labelParam: 'Jenis Kuliner',
                  hintParam: 'Masukan Jenis Kuliner',
                  iconParam: const Icon(Icons.fastfood),
                  inputType: TextInputType.text,
                  messageParam: 'Jenis Kuliner tidak boleh kosong!',
                ),
                TextFieldWidget(
                  textcontroller: _hargaController,
                  labelParam: 'Harga Kuliner',
                  hintParam: 'Masukan Harga Kuliner',
                  iconParam: const Icon(Icons.price_change),
                  inputType: TextInputType.number,
                  messageParam: 'Harga tidak boleh kosong!',
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Alamat"),
                      _alamat == null
                          ? const SizedBox(
                              width: double.infinity,
                              child: Text("Alamat Kosong"))
                          : Text('$_alamat'),
                      _alamat == null
                          ? TextButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapsScreen(
                                        onLocationSelected: (selectedAddress) {
                                      setState(() {
                                        _alamat = selectedAddress;
                                      });
                                    }),
                                  ),
                                );
                              },
                              child: const Text('Pilih Alamat'),
                            )
                          : TextButton(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MapsScreen(
                                        onLocationSelected: (selectedAddress) {
                                      setState(() {
                                        _alamat = selectedAddress;
                                      });
                                    }),
                                  ),
                                );
                                setState(() {
                                  {}
                                });
                              },
                              child: const Text('Ubah Alamat'),
                            ),
                    ],
                  ),
                ),
                _image == null
                    ? const Text(
                        "Belum ada gambar yang dipilih",
                        style: TextStyle(fontSize: 15),
                      )
                    : Image.file(_image!),
                ElevatedButton(
                  onPressed: getImage,
                  child: const Text("Pilih Gambar"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var result = await kulinerController.addKuliner(
                        Kuliner(
                            nama: _namaController.text,
                            tempat: _alamat!,
                            jenis: _jenisController.text,
                            harga: int.parse(_hargaController.text),
                            gambar: _image!.path),
                        _image,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result['message'],
                          ),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Data tidak boleh kosong",
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Submit".toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
