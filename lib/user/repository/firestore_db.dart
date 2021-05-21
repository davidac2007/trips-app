import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips_app/user/model/user.dart';

class CloudFirestoreDB {
  final String users = "users";
  final String places = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(UserModel user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavPlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}
