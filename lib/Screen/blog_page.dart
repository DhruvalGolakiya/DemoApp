// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/addblog_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => addBlog()),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
