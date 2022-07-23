import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_csw/firebase/firestore_methods.dart';
import 'package:flutter_application_csw/functions/snackbar.dart';
import 'package:flutter_application_csw/models/user_model.dart';
import 'package:flutter_application_csw/screens/home_screen.dart';
import 'package:flutter_application_csw/screens/splash_screen.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  Future<void> createUser(
      UserModel userModel, String password, BuildContext context) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: userModel.email, password: password)
          .then((value) {
        FirestoreMethods()
            .addUser(userModel.copyWith(uid: value.user!.uid), context);
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => SplashScreen()));
    } on Exception catch (e) {
      showSnackbar(context: context, content: e.toString());
      print(e.toString());
    }
  }

  Future<void> loginUser(
      String username, String pass, BuildContext context) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: username, password: pass);
      await FirestoreMethods().getUserDetails(credential.user!.uid, context);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => SplashScreen()));
    } on Exception catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }
}
