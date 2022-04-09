// ignore_for_file: unused_import, duplicate_import, unrelated_type_equality_checks, prefer_const_constructors, unused_local_variable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_demo1/Screen/landing_page.dart';
import 'package:flutter_demo1/Screen/login_page.dart';
import 'package:flutter_demo1/models/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoutesGen {
  var userStatus = FirebaseAuth.instance.currentUser;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        if (FirebaseAuth.instance.currentUser != true) {
          return MaterialPageRoute(builder: (_) => HomePage());
        } else {
          return MaterialPageRoute(builder: (_) => LoginPage());
        }

      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(child: Text("ERRRRROOORR")),
      );
    });
  }
}
