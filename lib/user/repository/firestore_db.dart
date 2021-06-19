import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/model/user.dart';

class CloudFirestoreDB {
  final String users = "users";
  final String places = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(UserModel user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavPlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(PlaceModel place) async {
    CollectionReference placesRef = _db.collection(places);

    final String userUid = _auth.currentUser.uid;

    await placesRef.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("$users/$userUid") // reference
    }).then((DocumentReference dr) {
      dr.get().then((DocumentSnapshot snapshot) {
        snapshot.id; // place id
        DocumentReference refUsers = _db.collection(users).doc(userUid);
        refUsers.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc("$places/${snapshot.id}")])
        });
      });
    });
  }
}
