import 'package:flutter/material.dart';

import 'package:trips_app/place/ui/widgets/gradient_back.dart';

import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[GradientBack("Welcome", 250.0), CardImageList()],
    );
  }
}
