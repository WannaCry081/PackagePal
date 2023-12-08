import "package:cloud_firestore/cloud_firestore.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";


class DatabaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userUid = AuthViewModel().getUserUID;
  final String _email = AuthViewModel().getUserEmail;

  //User 
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserCredential() async {
    final collection = _firestore.collection(_userUid).doc("$_userUid+$_email");
    return await collection.get();
  }

  Future<void> addUserCredential(Map<String, dynamic> data) async {
    final userInformationCollection = _firestore.collection(_userUid).doc("$_userUid+$_email");
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    await userInformationCollection.set(data);
    await orderCollection.set({
      "Orders" : []
    });
    return;
  }

}