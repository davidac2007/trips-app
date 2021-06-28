import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/place/ui/widgets/card_image.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/ui/widgets/profile_card_image.dart';

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
      'userOwner': _db.doc("$users/$userUid"),
      'urlImage': place.uriImage // reference
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

  List<ProfileCardImage> buildMyPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<ProfileCardImage> profilePlaces = [];
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfileCardImage(
        place: PlaceModel(
            name: p['name'],
            description: p['description'],
            uriImage: p['urlImage']),
      ));
    });
    return profilePlaces;
  }

  List<CardImage> buildPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<CardImage> placesCard;
    placesListSnapshot.forEach((p) {
      placesCard.add(CardImage(
        pathImage: p["urlImage"],
        left: 20,
        width: 320,
        height: 420,
        onPressedFabIcon: () {},
        iconData: Icons.favorite_border,
      ));
    });
  }
}
