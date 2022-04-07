import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo1/Screen/home_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooglewithSignin extends ChangeNotifier {
/*   */

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  /*  GoogleSignInAccount get user => _user!; */

  Future googleLogin() async {
    GoogleSignInAccount? _user = _googleSignIn.currentUser;
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
  }
}
