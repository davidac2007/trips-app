import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/repository/auth_repository.dart';
import 'package:trips_app/user/repository/cloud_firestore_repo.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  // Firebase Stream
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //Sign In with Google
  Future<UserCredential> signIn() => _authRepository.signInFirebase();

  //Save user in database
  final _cloudFirestoreRepo = CloudFirestoreRepo();
  void updateUserData(UserModel user) =>
      _cloudFirestoreRepo.updateUserDataFirestore(user);

  //Save place data in Firestore

  Future<void> updatePlaceData(PlaceModel place) =>
      _cloudFirestoreRepo.updatePlaceData(place);

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
