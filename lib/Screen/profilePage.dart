// ignore_for_file: unnecessary_this, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/models/usermodel.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ProfilePage"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                "Full Profile Information",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${loggedInUser.email}',
              style: TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 94, 94, 94)),
            ),
            SizedBox(
              height: 20,
            ),
            Text("FirstName :-" "   " '${loggedInUser.firstName}',
                style: TextStyle(fontSize: 17)),
            SizedBox(
              height: 10,
            ),
            Text(
              "LastName :-" "   " '${loggedInUser.lastName}',
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
