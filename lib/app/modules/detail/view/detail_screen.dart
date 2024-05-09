import 'package:flutter/material.dart';
import 'package:tastetraverse_app/app/modules/detail/widget/detail_widget.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.data});
  final Map data;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                  onPressed: () {},
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
