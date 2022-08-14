import 'package:flutter/material.dart';
import 'package:photo_album/Screens/photo_album.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical Task'),
      ),
      body: Container(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotoAlbum(),
              ),
            );
          },
          child: Center(
            child: Text("Load album"),
          ),
        ),
      ),
    );
  }
}
