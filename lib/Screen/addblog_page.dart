// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, invalid_use_of_visible_for_testing_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo1/models/crud.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class addBlog extends StatefulWidget {
  @override
  State<addBlog> createState() => _addBlogState();
}

class _addBlogState extends State<addBlog> {
  late String TitleName, Desc;
  XFile selectedImage;
  bool _isLoading = false;
  CrudMethod crudMethods = new CrudMethod();

  Future getImage() async {
    XFile? image = await ImagePickerPlatform; get platform(source: ImageSource.gallery);

    setState(() {
      selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Blog"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 144, 144, 144),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Icon(
              FontAwesomeIcons.camera,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 350,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(hintText: "Blog Title"),
                  onChanged: (val) {
                    TitleName = val;
                  },
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Descripton"),
                  onChanged: (val) {
                    Desc = val;
                  },
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
