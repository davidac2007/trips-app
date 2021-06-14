import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:trips_app/place/repository/firebase_storage_api.dart';

final _firebaseStorage = FirebaseStorageAPI();

class FirebaseStorageRepo {
  Future<UploadTask> uploadFile(String path, File image) =>
      _firebaseStorage.uploadFile(path, image);
}
