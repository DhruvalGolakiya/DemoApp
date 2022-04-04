// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 200, 188, 188),
        body: Center(
          child: Text(
            "HomePage",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ));
  }
}
