// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Drawer1 extends StatefulWidget {
  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
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
    return Drawer(
      backgroundColor: Color.fromARGB(255, 230, 230, 230),
      child: ListView(
        padding: EdgeInsets.zero,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          UserAccountsDrawerHeader(
            /* currentAccountPicture:, */
            accountEmail: Text(
              user!.email!,
            ),
            accountName: Text(
              "${loggedInUser.firstName}" "${loggedInUser.lastName}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
