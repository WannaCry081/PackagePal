import "package:cloud_firestore/cloud_firestore.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";


class DatabaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userUid = AuthViewModel().getUserUID;
  final String _email = AuthViewModel().getUserEmail;

  // User 
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


  // Orders
  Future<void> createOrder(List<dynamic> data) async {
  final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

  DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await orderCollection.get();
  Map<String, dynamic> currentData = documentSnapshot.data() ?? {};

  List<dynamic> ordersList = currentData["Orders"] ?? [];
  
  ordersList.addAll(data);

  await orderCollection.set({
    "Orders": ordersList,
  });

  return;
}


  Stream<List<dynamic>> getOrders() {
  final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

  return orderCollection.snapshots().map((snapshot) {
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;

      if (data['Orders'] != null) {
        final List<dynamic> orderList = data['Orders'];
        return orderList;
      } else {
        return [];
      }
    } else {
      return [];
    }
  });
}


}