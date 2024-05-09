import 'package:flutter/material.dart';
import 'package:tastetraverse_app/api/controller/kuliner_controller.dart';
import 'package:tastetraverse_app/app/data/kuliner.dart';
import 'package:tastetraverse_app/app/modules/form/view/form_screen.dart';

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
        title: Text(
          'TasteTraverse',
        ),
      ),
      body: FutureBuilder<List<Kuliner>>(
        future: _kulinerController.getKuliner(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].nama),
                  subtitle: Text(snapshot.data![index].jenis),
                  trailing: Text(snapshot.data![index].harga.toString()),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
