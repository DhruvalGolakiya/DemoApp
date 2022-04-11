// ignore_for_file: use_key_in_widget_constructors, camel_case_types, annotate_overrides, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class image extends StatelessWidget {
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

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;
    var imgurl = storage.ref('1.png.jpeg').getDownloadURL();
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('infor').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Center(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Text(data['name']),
                    Text(data['info']),
                    Text(data['imgurl']),
                  ],
                ),
              ));
            }).toList(),
          );
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
