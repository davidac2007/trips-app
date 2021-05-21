import 'package:flutter/material.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/ui/widgets/profile_app_bar.dart';

import 'package:trips_app/user/ui/widgets/profile_card_image.dart';

class ProfileCardImageList extends StatelessWidget {
  final PlaceModel place = PlaceModel(
      "",
      "Knuckles Mountains Range",
      "Hiking. Water fall hunting. Natural bath",
      3,
      "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      null);
  final PlaceModel place2 = PlaceModel(
      "",
      "Mountains",
      "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
      10,
      "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
      null);
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
          ProfileCardImage(place),
          ProfileCardImage(place2),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }
}
