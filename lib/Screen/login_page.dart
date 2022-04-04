// ignore_for_file: use_key_in_widget_constructors, unused_field, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form Key

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //email Field

    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        //validator: (){},
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
        //validator: (){},
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
      elevation: 7,
      borderRadius: BorderRadius.circular(20),
      color: Colors.blueAccent,
      child: MaterialButton(
        splashColor: Color.fromARGB(255, 255, 0, 0),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
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
            padding: const EdgeInsets.all(30.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[emailField, passwordField, LoginButton],
                )),
          ),
        ),
      )),
    );
  }
}
