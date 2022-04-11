// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_this, unused_local_variable, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/blog_page.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/Screen/profile.dart';
import 'package:flutter_demo1/Screen/settings.dart';

import 'package:flutter_demo1/models/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motion_tab_bar_v2/motion-tab-item.dart';

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
          Row(),
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              selectedDest(4);
            },
            accountName: user?.displayName != null
                ? Text(
                    user!.displayName!,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )
                : Text(
                    "${loggedInUser.firstName}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
            accountEmail: user?.email != null
                ? Text(
                    user!.email!,
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 246, 246)),
                  )
                : Text(
                    "${loggedInUser.email}",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
            currentAccountPicture: user?.photoURL != null
                ? ClipOval(
                    child: Material(
                    color: Colors.red,
                    child: Image.network(
                      user!.photoURL!,
                      fit: BoxFit.contain,
                    ),
                  ))
                : Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color.fromARGB(255, 241, 241, 241),
                        ),
                      ),
                    ),
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
              onTap: () => selectedDest(3)),
          ListTile(
              title: Text("Blogs"),
              leading: Icon(FontAwesomeIcons.blogger),
              onTap: () => selectedDest(5)),
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
        break;
      case 5:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BlogPage()));
        break;
    }
  }

  Future<void> logout(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
