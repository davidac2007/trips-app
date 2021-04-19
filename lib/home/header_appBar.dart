import 'package:flutter/material.dart';

import 'package:trips_app/home/gradient_back.dart';

import 'card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[GradientBack("Welcome"), CardImageList()],
    );
  }
}
