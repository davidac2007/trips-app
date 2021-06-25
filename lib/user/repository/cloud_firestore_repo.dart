import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/repository/firestore_db.dart';
import 'package:trips_app/user/ui/widgets/profile_card_image.dart';

class CloudFirestoreRepo {
  final _cloudFirestore = CloudFirestoreDB();

  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestore.updateUserData(user);

  Future<void> updatePlaceData(PlaceModel place) =>
      _cloudFirestore.updatePlaceData(place);

  List<ProfileCardImage> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestore.buildPlaces(placesListSnapshot);
}
