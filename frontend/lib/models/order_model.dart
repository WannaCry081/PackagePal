class OrderModel {
  String? name;
  // String? id;
  String? pin;
  String? weight;
  String? price;
  String? status;
  String? deliveryName;
  String? deliveryContact;

  OrderModel(
    {
      required this.name,
      required this.pin,
      required this.weight,
      required this.price,
      required this.status,
      required this.deliveryName,
      required this.deliveryContact});

  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "pin" : pin,
      "weight" : weight,
      "price" : price,
      "status" : status,
      "deliveryName" : deliveryName,
      "deliveryContact" : deliveryContact,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> data) {
    return OrderModel(
      name: data["name"],
      pin: data["pin"],
      weight: data["weight"],
      price: data["price"],
      status: data["status"],
      deliveryName: data["deliveryName"],
      deliveryContact: data["deliveryContact"],
    );
  }
}