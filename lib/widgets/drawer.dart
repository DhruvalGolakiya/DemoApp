// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/Screen/profilePage.dart';
import 'package:flutter_demo1/Screen/setting_page.dart';

import 'package:flutter_demo1/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class Drawer1 extends StatefulWidget {
  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final user = FirebaseAuth.instance.currentUser;

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
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: () => selectedDest(4),
            currentAccountPicture: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://st2.depositphotos.com/3369547/11386/v/950/depositphotos_113863470-stock-illustration-avatar-man-icon-people-design.jpg?forcejpeg=true"),
                  ),
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 4, 80, 244)),
            ),
            accountEmail: Text(
              user!.email!,
            ),
            accountName: Text(
              "${loggedInUser.firstName}" "${loggedInUser.lastName}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            selectedColor: Colors.black,
            subtitle: Text("INFO"),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            onTap: () => selectedDest(0),
          ),
          ListTile(
              title: Text("I2"),
              leading: Icon(Icons.settings),
              onTap: () => selectedDest(1)),
          ListTile(
              title: Text("I3"),
              leading: Icon(Icons.settings),
              onTap: () => selectedDest(2)),
          ListTile(
              title: Text("LogOut"),
              leading: Icon(Icons.exit_to_app),
              onTap: () => selectedDest(3))
        ],
      ),
    );
  }

  void selectedDest(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingPage()));
        break;
      case 3:
        Widget cancelButton = TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        );
        Widget continueButton = TextButton(
          child: Text("Continue"),
          onPressed: () {
            logout(context);
          },
        );
        AlertDialog alert = AlertDialog(
          title: Text("Alert"),
          content: Text("Are you sure you want to logout?"),
          actions: [cancelButton, continueButton],
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ProfilePage()));
    }
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
