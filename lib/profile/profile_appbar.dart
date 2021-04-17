import 'package:flutter/material.dart';
import 'package:trips_app/home/card_image_list.dart';
import 'package:trips_app/profile/profile_background.dart';
import 'package:trips_app/profile/profile_buttons.dart';
import 'package:trips_app/profile/profile_details.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ProfileTitle(),
        Column(
          children: [
            ProfileDetails("assets/img/Me.jpg", "David Avendaño\n",
                " d.avendanooo.c@hotnmail.com"),
            ProfileButtons(),
            CardImageList()
          ],
        )
      ],
    );
  }
}
