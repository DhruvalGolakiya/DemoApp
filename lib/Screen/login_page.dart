// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, prefer_const_literals_to_create_immutables, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/home_page.dart';
import 'package:flutter_demo1/Screen/home_page1.dart';
import 'package:flutter_demo1/Screen/signup_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form Key

  final _formKey = GlobalKey<FormState>();

  //editing Controller

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // firebase

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email Field

    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
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
          emailController.text = value!;
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

    // password Field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
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
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.key,
              color: Color.fromARGB(255, 155, 152, 152),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))));
    final LoginButton = Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        splashColor: Color.fromARGB(255, 21, 0, 255),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          SignIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
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
                      height: 300,
                      child: Image.asset(
                        "assets/login.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    emailField,
                    SizedBox(height: 15),
                    passwordField,
                    SizedBox(height: 25),
                    LoginButton,
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      )),
    );
  }
// Login Func

  void SignIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Success"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => HomePage())))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
