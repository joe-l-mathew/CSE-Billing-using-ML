import 'package:flutter/cupertino.dart';
import 'package:flutter_application_csw/models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel? userModel;
  setUserModel(userMdl) {
    userModel = userMdl;
    notifyListeners();
  }
}
