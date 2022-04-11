// ignore_for_file: unnecessary_this, prefer_const_constructors, use_key_in_widget_constructors, file_names, unused_import, unused_catch_clause, avoid_print, sized_box_for_whitespace

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_demo1/models/usermodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  File? image;
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
  // ignore: unused_element
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
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            user?.photoURL != null
                ? ClipOval(
                    child: Material(
                    child: Image.network(
                      user!.photoURL!,
                      fit: BoxFit.contain,
                      height: 100,
                    ),
                  ))
                : Container(
                    width: 100,
                    height: 100,
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 80,
                            color: Color.fromARGB(255, 241, 241, 241),
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 15,
            ),
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueAccent,
              child: MaterialButton(
                splashColor: Color.fromARGB(255, 21, 0, 255),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                minWidth: 280,
                onPressed: () {
                  pickImage();
                },
                child: Text(
                  "Click here to change Image",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            user?.displayName != null
                ? Text(
                    user!.displayName!,
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 94, 94, 94)),
                  )
                : Text(
                    "${loggedInUser.firstName}",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 94, 94, 94)),
                  ),
            SizedBox(
              height: 20,
            ),
            /* Text("FirstName :-" "   " '${loggedInUser.firstName}',
                style: TextStyle(fontSize: 17)),
            SizedBox(
              height: 10,
            ),
            Text(
              "LastName :-" "   " '${loggedInUser.lastName}',
              style: TextStyle(fontSize: 17),
            ), */
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed');
    }
  }
}
