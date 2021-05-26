import 'package:flutter/material.dart';

import 'package:trips_app/user/ui/widgets/profile_background.dart';

import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[GradientBackk(250.0, "Welcome"), CardImageList()],
    );
  }
}
