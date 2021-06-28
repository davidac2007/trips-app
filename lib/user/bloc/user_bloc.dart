import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/place/repository/firebase_storage_repo.dart';
import 'package:trips_app/place/ui/widgets/card_image.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/repository/auth_repository.dart';
import 'package:trips_app/user/repository/cloud_firestore_repo.dart';
import 'package:trips_app/user/repository/firestore_db.dart';
import 'package:trips_app/user/ui/widgets/profile_card_image.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();
  final _firebaseAuth = FirebaseAuth.instance;
  final _cloudFirestore = CloudFirestoreDB();
  // Firebase Stream
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  Future<User> get currentUser async {
    return _firebaseAuth.currentUser;
  }

  //Sign In with Google
  Future<UserCredential> signIn() => _authRepository.signInFirebase();

  //Save user in database
  final _cloudFirestoreRepo = CloudFirestoreRepo();
  void updateUserData(UserModel user) =>
      _cloudFirestoreRepo.updateUserDataFirestore(user);

  // Save in FirebaseStorage
  final _firebaseStorageRepo = FirebaseStorageRepo();
  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorageRepo.uploadFile(path, image);

  //Save place data in Firestore

  Future<void> updatePlaceData(PlaceModel place) =>
      _cloudFirestoreRepo.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreDB().places)
      .snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepo.buildPlaces(placesListSnapshot);
  List<ProfileCardImage> buildMyPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestore.buildMyPlaces(placesListSnapshot);

  signOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {}
}
