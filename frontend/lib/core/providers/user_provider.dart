import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:frontend/models/user_model.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:frontend/viewmodels/database_viewmodel.dart';

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

  Future<void> fetchUserCredential() async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot = await 
      DatabaseViewModel().getUserCredential();

    notifyListeners();
    return;
  }

  Future<void> addUserCredential(Map<String, dynamic> data) async {
    await DatabaseViewModel().addUserCredential(
      data
    );

    fetchUserCredential();
    return;
  }

  Map<String, dynamic>? getUserData() {
    return _user;
  }
}
