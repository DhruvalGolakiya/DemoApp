import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class imgStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final Storage storage = Storage();
    return FutureBuilder(
        future: storage.downloadURl('1.png.jpeg'),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Container(
                      width: 400,
                      height: 200,
                      child: Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Container();
        });
  }
}

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURl(String imageName) async {
    String downloadURL =
        await storage.ref('images/$imageName').getDownloadURL();
    return downloadURL;
  }
}
