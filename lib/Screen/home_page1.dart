// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/models/usermodel.dart';

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
        body: Center(
      child: Text(user!.email!),
    ));
  }
}
