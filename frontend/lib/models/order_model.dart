class OrderModel {
  String? id;
  String? name;
  String? pin;
  String? weight;
  String? price;
  String? status;
  String? deliveryName;
  String? deliveryContact;
  String? deliveryDate;

  OrderModel(
    {
      this.id,
      required this.name,
      required this.pin,
      required this.weight,
      required this.price,
      required this.status,
      required this.deliveryName,
      required this.deliveryContact,
      required this.deliveryDate});

  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "name" : name,
      "pin" : pin,
      "weight" : weight,
      "price" : price,
      "status" : status,
      "deliveryName" : deliveryName,
      "deliveryContact" : deliveryContact,
      "deliveryDate" : deliveryDate
    };
  }

  @override
  String toString() {
    return 'OrderModel{id: $id, name: $name, pin: $pin, weight: $weight, price: $price, status: $status, deliveryName: $deliveryName, deliveryContact: $deliveryContact, deliveryDate: $deliveryDate}';
  }

  factory OrderModel.fromMap(Map<String, dynamic> data) {
    return OrderModel(
      id: data["id"],
      name: data["name"],
      pin: data["pin"],
      weight: data["weight"],
      price: data["price"],
      status: data["status"],
      deliveryName: data["deliveryName"],
      deliveryContact: data["deliveryContact"],
      deliveryDate: data["deliveryDate"]
    );
  }
}