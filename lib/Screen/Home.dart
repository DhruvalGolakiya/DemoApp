// ignore_for_file: prefer_const_constructors, unnecessary_this, unused_import, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/models/firestoreimage.dart';
import 'package:flutter_demo1/models/infoStore.dart';
import 'package:flutter_demo1/models/usermodel.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_demo1/models/storage.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imgStore(),
              infoStore(),
              imgStore(),
              imgStore(),
              imgStore(),
            ],
          ),
        ),
      ),
    );
  }
}
