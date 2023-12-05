import "package:flutter/material.dart";
import "package:frontend/models/user_model.dart";
import "package:firebase_auth/firebase_auth.dart";

class UserProvider extends ChangeNotifier {
  Map<String, dynamic>? _user;

  UserProvider() {
    _init();
  }

  void _init() {
    _user = null;
    notifyListeners();
  }

  void setUserData(UserModel data) {
    _user = data.toMap();
    return;
  }

  Map<String, dynamic>? getUserData() {
    return _user;
  }
}
