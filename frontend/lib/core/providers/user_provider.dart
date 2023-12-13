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

  void setUserData(Map<String, dynamic> data) {
    _user = data;
    return;
  }

  
  Future<void> fetchUserCredential() async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot = await DatabaseViewModel().fetchUserCredentials();
    Map<String, dynamic> userDataMap = docSnapshot.data() ?? {};
    setUserData(userDataMap);

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

  Future<void> updateUserCredential(Map<String, dynamic> data) async {
    await DatabaseViewModel().updateUserCredential(
      data
    );

    await fetchUserCredential();
  }


  Map<String, dynamic>? getUserData() {
    return _user;
  }
}
