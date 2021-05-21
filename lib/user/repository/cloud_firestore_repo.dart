import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/repository/firestore_db.dart';

class CloudFirestoreRepo {
  final _cloudFirestore = CloudFirestoreDB();

  void updateUserDataFirestore(UserModel user) =>
      _cloudFirestore.updateUserData(user);
}
