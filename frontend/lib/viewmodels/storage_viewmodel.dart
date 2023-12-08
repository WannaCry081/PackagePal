import 'package:firebase_storage/firebase_storage.dart';

class StorageViewModel {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getImage(String imageName) async {
    String image = await _storage.ref(imageName).getDownloadURL();
    return image;
  } 
}
