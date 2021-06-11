import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/repository/firestore_db.dart';

class CloudFirestoreRepo {
  final _cloudFirestore = CloudFirestoreDB();

  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestore.updateUserData(user);

  Future<void> updatePlaceData(PlaceModel place) =>
      _cloudFirestore.updatePlaceData(place);
}
