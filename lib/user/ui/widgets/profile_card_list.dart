import 'package:flutter/material.dart';
import 'package:trips_app/user/ui/widgets/profile_app_bar.dart';

import 'package:trips_app/user/ui/widgets/profile_card_image.dart';

class ProfileCardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.0),
      height: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(20.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ProfileAppBar(),
          ProfileCardImage(
              "assets/img/mountainsk.jpeg",
              "Knuckles Mountains Range",
              "Hiking. Water fall hunting. Natural bath, Scenery & Photography",
              "Steps 123,123,123",
              null),
          ProfileCardImage(
              "assets/img/mountain.jpeg",
              "Mountains",
              "Hiking. Water fall hunting. Natural bath, Scenery & Photography",
              "Steps 321,321,321",
              null),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }
}
