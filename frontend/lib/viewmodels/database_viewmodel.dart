import "package:cloud_firestore/cloud_firestore.dart";
import "package:frontend/models/order_model.dart";
import "package:frontend/viewmodels/auth_viewmodel.dart";


class DatabaseViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _userUid = AuthViewModel().getUserUID;
  final String _email = AuthViewModel().getUserEmail;

  // User 
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserCredential() {
    final collection = _firestore.collection(_userUid).doc("$_userUid+$_email");
    return collection.snapshots();
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

  Future<void> updateUserCredential(Map<String, dynamic> updates) async {
    final userInformationCollection = _firestore.collection(_userUid).doc("$_userUid+$_email");

    final snapshot = await userInformationCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final userData = snapshot.data() as Map<String, dynamic>;
    if (userData.isEmpty) {
      return;
    }

    updates.forEach((key, value) {
      userData[key] = value;
    });

    await userInformationCollection.set(userData);
  }

  Future<void> updateDisplayName(String displayName) async {
    final userInformationCollection = _firestore.collection(_userUid).doc("$_userUid+$_email");

    final snapshot = await userInformationCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final userData = snapshot.data() as Map<String, dynamic>;
    if (userData.isEmpty) {
      return;
    }

    userData['displayName'] = displayName;

    await userInformationCollection.set(userData);
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

  Future<void> deleteOrder(int index) async {
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    final snapshot = await orderCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final orderData = snapshot.data() as Map<String, dynamic>;
    if (orderData.isEmpty || orderData['Orders'] == null) {
      return;
    }

    List<dynamic> ordersList = List.from(orderData['Orders']);
    if (index < 0 || index >= ordersList.length) {
      return;
    }

    ordersList.removeAt(index);
    await orderCollection.set({
      "Orders": ordersList,
    });
    return;

  }
  
  Future<void> updateOrderStatus(int index, String newStatus) async {
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    final snapshot = await orderCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final orderData = snapshot.data() as Map<String, dynamic>;
    if (orderData.isEmpty || orderData['Orders'] == null) {
      return;
    }

    List<dynamic> ordersList = List.from(orderData['Orders']);
    if (index < 0 || index >= ordersList.length) {
      return;
    }

    // Update only the 'status' property of the specified item
    ordersList[index]['status'] = newStatus;

    await orderCollection.set({
      "Orders": ordersList,
    });
  }

  Future<void> updateOrder(int index, OrderModel updates) async {
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    final snapshot = await orderCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final orderData = snapshot.data() as Map<String, dynamic>;
    if (orderData.isEmpty || orderData['Orders'] == null) {
      return;
    }

    List<dynamic> ordersList = List.from(orderData['Orders']);
    if (index < 0 || index >= ordersList.length) {
      return;
    }

    Map<String, dynamic> orderToUpdate = Map.from(ordersList[index]);
    orderToUpdate.addAll(updates.toMap()); 

    ordersList[index] = orderToUpdate;

    await orderCollection.set({
      "Orders": ordersList,
    });
  }

  Stream<List<dynamic>> getOrdersOnToday() {
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    return orderCollection.snapshots().map((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;

        if (data['Orders'] != null) {
          final List<dynamic> orderList = data['Orders'];

          final String todayDate = DateTime.now().toLocal().toString().split(' ')[0];

          final List<dynamic> ordersOnToday = orderList.where((order) {
            final String deliveryDate = order['deliveryDate']; // Adjust the key based on your data structure
            return deliveryDate == todayDate;
          }).toList();

          return ordersOnToday;
        } else {
          return [];
        }
      } else {
        return [];
      }
    });
  }


  Future<void> updateStatusToCompleted(int index) async {
    final orderCollection = _firestore.collection(_userUid).doc("$_userUid+Orders");

    final snapshot = await orderCollection.get();
    if (!snapshot.exists) {
      return;
    }

    final orderData = snapshot.data() as Map<String, dynamic>;
    if (orderData.isEmpty || orderData['Orders'] == null) {
      return;
    }

    List<dynamic> ordersList = List.from(orderData['Orders']);
    if (index < 0 || index >= ordersList.length) {
      return;
    }

    Map<String, dynamic> orderToUpdate = Map.from(ordersList[index]);
    orderToUpdate['status'] = 'Completed'; // Update only the 'status' property

    ordersList[index] = orderToUpdate;

    await orderCollection.set({
      "Orders": ordersList,
    });
  }







}