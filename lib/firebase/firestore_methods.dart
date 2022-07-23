
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_csw/models/user_model.dart';
import 'package:flutter_application_csw/provider/user_provider.dart';
import 'package:provider/provider.dart';

class FirestoreMethods {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel,BuildContext context) async {
    print(userModel.toMap());
    await _firestore
        .collection('user')
        .doc(userModel.uid)
        .set(userModel.toMap());
    getUserDetails(userModel.uid!,context);
  }

  Future<void> getUserDetails(String uid,BuildContext context) async {
    DocumentSnapshot<Map<String, dynamic>> recived =
        await _firestore.collection('user').doc(uid).get();
    UserModel userModel = UserModel.fromMap(recived.data()!);
    Provider.of<UserProvider>(context, listen: false).setUserModel(userModel);
  }
}
