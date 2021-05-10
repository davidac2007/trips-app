import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  //Sign In with Google
  Future<UserCredential> signIn() {
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {}
}
