import 'package:flutter/material.dart';

import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/user/ui/widgets/profile_card_list.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
        // alignment: Alignment.center,
        children: [
          ProfileBackground(screenHeight * 0.45),
          ProfileCardImageList()
        ]);
  }
}
