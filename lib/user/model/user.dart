import 'package:trips_app/place/model/place.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<PlaceModel> myPlaces;
  final List<PlaceModel> myFavPlaces;

  UserModel(this.uid, this.name, this.email, this.photoURL, this.myPlaces,
      this.myFavPlaces);
}
