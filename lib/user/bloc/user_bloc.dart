import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  // Firebase Stream
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //Sign In with Google
  Future<UserCredential> signIn() {
    return _authRepository.signInFirebase();
  }

  @override
  void dispose() {}
}
