import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_card_image.dart';

class ProfileCardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 300.0, bottom: 10.0),
      height: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ProfileCardImage("assets/img/beach.jpeg", "Knuckles Mountains Range",
              "Hiking. Water fall hunting. Natural bath, Scenery & Photography"),
          ProfileCardImage("assets/img/beach_palm.jpeg", "Hello", "Hi"),
          ProfileCardImage("assets/img/mountain.jpeg", "Hello", "Hi"),
          ProfileCardImage("assets/img/mountain_stars.jpeg", "Hello", "Hi"),
          ProfileCardImage("assets/img/river.jpeg", "Hello", "Hi"),
          ProfileCardImage("assets/img/sunset.jpeg", "Hello", "Hi"),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }
}
