import "package:firebase_auth/firebase_auth.dart";
import "package:frontend/viewmodels/storage_viewmodel.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    final googleUser = await _signIn.signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

    await _auth.signInWithCredential(credential);
    return;
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      String? image = await StorageViewModel().getImage("Avatar.png");
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      credential.user?.updateDisplayName(email.split("@")[0]);
      credential.user?.updatePhotoURL(image);

      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  void signOutGoogle() async {
    await _signIn.signOut();
    await _auth.signOut();
  }

  Future<void> authenticationChangePassword(
    String oldPassword,
    String newPassword
  ) async {

    final currentUser = _auth.currentUser!;

    final credential = EmailAuthProvider.credential(
      email : currentUser.email!, 
      password: oldPassword
    );

    await currentUser.reauthenticateWithCredential(credential);
    await currentUser.updatePassword(newPassword);

    return;
  }


  String get getUserDisplayName => _auth.currentUser?.displayName ?? "";
  String get getUserEmail => _auth.currentUser?.email ?? "";
  String get getUserPhotoUrl => _auth.currentUser?.photoURL ?? "";
  String get getUserUID => _auth.currentUser!.uid;
}
