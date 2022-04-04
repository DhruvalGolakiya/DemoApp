// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/login_page.dart';

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
  @override
  Widget build(BuildContext context) {
    //first Name field
    final firstName = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        //validator: (){},
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
        //validator: (){},
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
        //validator: (){},
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
        //validator: (){},
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
        //validator: (){},
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
        onPressed: () {},
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
}
