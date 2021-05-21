import 'package:trips_app/user/model/user.dart';

class PlaceModel {
  String id;
  String name;
  String description;
  String uriImage;
  int likes;
  UserModel userOwner;

  PlaceModel(this.id, this.name, this.description, this.likes, this.uriImage,
      this.userOwner);
}
