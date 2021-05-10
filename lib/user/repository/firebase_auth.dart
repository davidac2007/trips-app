import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleAuth = GoogleSignIn();

  Future<UserCredential> signIn() async {
    await Firebase.initializeApp();
    final GoogleSignInAccount googleUser = await _googleAuth.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    UserCredential user = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken));

    return user;
  }
}
