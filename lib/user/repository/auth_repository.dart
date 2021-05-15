import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app/user/repository/firebase_auth.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuthentication();

  Future<UserCredential> signInFirebase() => _firebaseAuth.signIn();

  signOut() => _firebaseAuth.signOut();
}
