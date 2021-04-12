import 'package:flutter/material.dart';
import 'package:trips_app/place_description.dart';
import 'package:trips_app/review_list.dart';

import 'header_appBar.dart';

class HomeTrips extends StatelessWidget {
  final String randomDescription =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
      " \n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Bahamas", 3, randomDescription),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}
