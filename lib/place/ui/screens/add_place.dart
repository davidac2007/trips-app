import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/place/ui/widgets/button.dart';
import 'package:trips_app/place/ui/widgets/card_image.dart';
import 'package:trips_app/place/ui/widgets/tlocation_input.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/widgets/text_input.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  AddPlaceScreen({this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerPlaceTitle = TextEditingController();
    final _controllerPlaceDescription = TextEditingController();
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBackk(height: 300.0, title: "", align: 60.0),
          Container(
            margin: EdgeInsets.only(bottom: 40.0, top: 20.0),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                      height: 280,
                      width: 350,
                      left: 0.0,
                      pathImage: widget.image.path,
                      iconData: Icons.camera_alt),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20.0, top: 30.0),
                    child: TextInput(
                        hintText: "Title",
                        inputType: null,
                        controller: _controllerPlaceTitle,
                        maxLines: 1)),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    controller: _controllerPlaceDescription,
                    maxLines: 4),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: LocationInput(
                    hintText: "Add location",
                    icon: Icons.location_on_outlined,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: Button(
                    buttonText: "Submit",
                    onPressed: () {
                      //Firebase Sotrage
                      //Storage URL
                      // Get logged user uid
                      userBloc.currentUser.then((User user) {
                        if (user != null) {
                          String uid = user.uid;
                          String path = "$uid/${DateTime.now().toString()}.jpg";

                          userBloc
                              .uploadFile(path, widget.image)
                              .then(((UploadTask uploadTask) {
                            uploadTask
                                .whenComplete(() {})
                                .then((TaskSnapshot snapshot) {
                              snapshot.ref.getDownloadURL().then((urlImage) {
                                print("Image url: $urlImage");
                                //Cloud Firestore
                                //Save place data, likes and userowneer

                                userBloc
                                    .updatePlaceData(PlaceModel(
                                  name: _controllerPlaceTitle.text,
                                  description: _controllerPlaceDescription.text,
                                  uriImage: urlImage,
                                  likes: 2,
                                ))
                                    .whenComplete(() {
                                  print("Finished");
                                  Navigator.pop(context);
                                });
                              });
                            });
                          }));
                        } else {}
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                    size: 48.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 40.0, left: 30.0, right: 10.0),
                  child: TitleHeader(title: "Add new place"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void launchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Uploading...'),
        actions: <Widget>[Center(child: CircularProgressIndicator())],
      ),
    );
  }
}
