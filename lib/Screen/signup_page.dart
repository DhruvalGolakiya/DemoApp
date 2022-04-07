// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/home_page.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/models/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUPState();
}

class _SignUPState extends State<SignUp> {
  //  Sign formKey
  final _formKey = GlobalKey<FormState>();
// animtion

  // controlller

  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailNameEditingController = TextEditingController();
  final passwordNameEditingController = TextEditingController();
  final confirmPasswordNameEditingController = TextEditingController();
  // firebase

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //first Name field
    final firstName = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');

          if (value!.isEmpty) {
            return ("FirstName cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name or Min 3 character");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Firstname",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
//Second Name field
    final SecondName = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');

          if (value!.isEmpty) {
            return ("Second cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid nane or Min 3 character");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Secondname",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
// Email Field
    final Email = TextFormField(
        autofocus: false,
        controller: emailNameEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Enter Email");
          }
          //reg expr for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Enter Valid Email Addresss");
          }
          return null;
        },
        onSaved: (value) {
          emailNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
//Password Field
    final Password = TextFormField(
        autofocus: false,
        controller: passwordNameEditingController,
        obscureText: true,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');

          if (value!.isEmpty) {
            return ("Enter Password");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password or Min 6 character");
          }
          return null;
        },
        onSaved: (value) {
          passwordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
// Confirm password
    final ConfirmPassword = TextFormField(
        autofocus: false,
        controller: confirmPasswordNameEditingController,
        obscureText: true,
        validator: (value) {
          if (confirmPasswordNameEditingController.text !=
              passwordNameEditingController.text) {
            return ("Check your password Again");
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.mail,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Confirmpassword",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
//Sign Up button
    final SignUpButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        splashColor: Color.fromARGB(255, 21, 0, 255),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          SignUp(emailNameEditingController.text,
              passwordNameEditingController.text);
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              color: Colors.red,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 55,
                                ),
                                firstName,
                                SizedBox(
                                  height: 20,
                                ),
                                SecondName,
                                SizedBox(
                                  height: 20,
                                ),
                                Email,
                                SizedBox(
                                  height: 20,
                                ),
                                Password,
                                SizedBox(
                                  height: 20,
                                ),
                                ConfirmPassword,
                                SizedBox(
                                  height: 20,
                                ),
                                SignUpButton,
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )))))));
  }

  void SignUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    // calling user model
    // sending these value

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing All values

    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");

    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
