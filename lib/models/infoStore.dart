// ignore_for_file: prefer_const_constructors
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class infoStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('info').snapshots();

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
                  child: Text(data['image']),
                ),
              );
            }).toList(),
          );
        });
  }
}
