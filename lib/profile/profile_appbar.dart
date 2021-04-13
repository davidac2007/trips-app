import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_details.dart';

import '../card_image_list.dart';
import '../gradient_back.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack("Profile"),
        ProfileDetails("assets/img/Me.jpg", "David Avendaño\n",
            " d.avendano.c@hotnmail.com")
      ],
    );
  }
}
