import "package:flutter/material.dart";
import "package:frontend/models/order_model.dart";
import "package:frontend/viewmodels/database_viewmodel.dart";

class OrderProvider extends ChangeNotifier {

  String ? _orderBy;
  String get getOrderBy => _orderBy ?? "deliveryDate";
  set setOrderBy(String orderBy){
    _orderBy = orderBy;
    notifyListeners();
  }
  
  List<OrderModel> _orderList = [];
  List<OrderModel> get getOrderLost  => _orderList;

  // Future<void> fetchOrders() async {
  //   List<dynamic> orders = await DatabaseViewModel().getOrders();

  //   _orderList = orders.map(
  //     (orderData) => OrderModel.fromMap(orderData as Map<String, dynamic>)
  //   ).toList();
    
  //   notifyListeners();
  // }

  Future<void> createOrder(List<dynamic> data) async {
    await DatabaseViewModel().createOrder(data);

    // fetchOrders();
    return;
  }
}