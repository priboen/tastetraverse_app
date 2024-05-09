import 'package:flutter/material.dart';
import 'package:tastetraverse_app/api/controller/kuliner_controller.dart';
import 'package:tastetraverse_app/app/modules/detail/widget/detail_widget.dart';
import 'package:tastetraverse_app/app/modules/home/view/home_screen.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.data});
  final Map data;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  KulinerController kulinerController = KulinerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Kuliner"),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                widget.data['gambar'],
              ),
              radius: 80,
            ),
            TextDetailWidget(
              textWidget: widget.data['nama'],
              ukuranBox: 15,
              styleParam: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              alignParam: TextAlign.center,
            ),
            TextDetailWidget(
              textWidget: widget.data['jenis'],
              ukuranBox: 15,
              styleParam: TextStyle(
                fontSize: 15,
              ),
              alignParam: TextAlign.center,
            ),
            TextDetailWidget(
              textWidget:
                  'Harga Kuliner: Rp. ${widget.data['harga'].toString()}',
              ukuranBox: 15,
              styleParam: TextStyle(
                fontSize: 15,
              ),
              alignParam: TextAlign.center,
            ),
            TextDetailWidget(
              textWidget: widget.data['tempat'],
              ukuranBox: 15,
              styleParam: TextStyle(
                fontSize: 15,
              ),
              alignParam: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  label: Text(
                    'Edit Data',
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Hapus Kuliner"),
                            content: Text(
                                "Apakah anda yakin ingin menghapus kuliner ini?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tidak"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  var result = await kulinerController
                                      .deleteKuliner(widget.data['id']);
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
                                      builder: (context) => HomeScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text("Ya"),
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                  label: Text(
                    'Hapus Data',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
