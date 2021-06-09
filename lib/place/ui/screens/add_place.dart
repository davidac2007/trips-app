import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/card_image.dart';
import 'package:trips_app/place/ui/widgets/tlocation_input.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          GradientBackk(height: 300.0, title: "", align: 60.0),
          Container(
            margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: CardImage(
                      height: 320,
                      width: 380,
                      left: 0.0,
                      pathImage: "assets/img/beach.jpeg",
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
}
