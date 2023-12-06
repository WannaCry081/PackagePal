class UserModel {
  String? uid;
  String? email;
  String? displayName;
  String? photoUrl;

  UserModel(
      {required this.uid,
      required this.email,
      required this.displayName,
      required this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "email": email,
      "displayName": displayName,
      "photoUrl": photoUrl
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data["uid"],
      email: data["email"],
      displayName: data["displayName"],
      photoUrl: data["photoUrl"],
    );
  }
}
