import "package:firebase_auth/firebase_auth.dart";
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

  void signOutGoogle() async {
    await _signIn.signOut();
    await _auth.signOut();
  }
}
