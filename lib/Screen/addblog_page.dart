// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, invalid_use_of_visible_for_testing_member, deprecated_member_use, unused_catch_clause, unnecessary_this, avoid_print, unused_element, unnecessary_new

import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo1/models/crud.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class addBlog extends StatefulWidget {
  @override
  State<addBlog> createState() => _addBlogState();
}

class _addBlogState extends State<addBlog> {
  CrudMethod crudMethods = CrudMethod();

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    uploadBlog() async {
      if (_photo != null) {
        setState(() {});

        /// uploading image to firebase storage
        StorageReference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child("blogImages")
            .child("${randomAlphaNumeric(9)}.jpg");

        final StorageUploadTask uploadTask = ref.putFile(file);

        var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
        print("this is url $downloadUrl");

        Map<String, String> blogMap = {
          "imgUrl": downloadUrl,
          "authorName": authorName,
          "title": title,
          "desc": desc
        };
        crudMethods.addData(blogMap).then((result) {
          Navigator.pop(context);
        });
      } else {}
    }
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(_photo!);

      /* var downloadURL = await storage.ref('files/$fileName').getDownloadURL();
      Map<String, String> blogMap = {
        'imgUrl': downloadURL,
        'Title': TitleNameEditingController.text,
        'Desc': DescNameEditingController.text,
      };
      crudMethods.addData(blogMap).then((result) {
        return Container();
      }); */
    } catch (e) {
      print('error occured');
    }
  }

  // Ttile and Desc Controller
  final TitleNameEditingController = TextEditingController();
  final DescNameEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Title = Container(
        width: 350,
        child: TextFormField(
            autofocus: false,
            controller: TitleNameEditingController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Please Enter Title");
              }

              return null;
            },
            onSaved: (value) {
              TitleNameEditingController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.person,
                  color: Color.fromARGB(255, 155, 152, 152),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                hintText: "Title",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)))));
    final Desc = Container(
        width: 350,
        child: TextFormField(
            autofocus: false,
            controller: DescNameEditingController,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Atleast Enter 10 Words");
              }

              return null;
            },
            onSaved: (value) {
              DescNameEditingController.text = value!;
            },
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.description,
                  color: Color.fromARGB(255, 155, 152, 152),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                hintText: "Description",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)))));
    final SignUpButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        splashColor: Color.fromARGB(255, 21, 0, 255),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        minWidth: 400,
        height: 60,
        onPressed: () {
          uploadFile();
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Blog"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  uploadFile();
                },
                child: Icon(Icons.upload),
              ))
        ],
      ),
      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: _photo != null
                ? Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Image.file(
                      _photo!,
                      fit: BoxFit.contain,
                    ))
                : Container(
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
          ),
          SizedBox(
            height: 10,
          ),
          Title,
          SizedBox(
            height: 10,
          ),
          Desc,
          SignUpButton,
        ]),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
