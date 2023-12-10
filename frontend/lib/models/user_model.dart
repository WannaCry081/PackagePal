class UserModel {
  String? uid;
  String? email;
  String? displayName;
  String? photoUrl;
  String? address;
  String? contactNumber;

  UserModel(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.photoUrl,
      required this.address,
      required this.contactNumber});

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "displayName": displayName,
      "photoUrl": photoUrl,
      "address" : address,
      "contactNumber" : contactNumber
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data["uid"],
      email: data["email"],
      displayName: data["displayName"],
      photoUrl: data["photoUrl"],
      address: data["address"],
      contactNumber: data["contactNumber"]
    );
  }
}
