import 'package:flutter/material.dart';
import 'package:trips_app/profile/profile_details.dart';

import '../card_image_list.dart';
import '../gradient_back.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          width: screenWidth,
          height: screenHeight * 0.45,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF4268D3), Color(0xFF584CD1)],
                  begin: FractionalOffset(0.2, 0.0),
                  end: FractionalOffset(1.0, 0.6),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: FittedBox(
            fit: BoxFit.none,
            alignment: Alignment(-1.5, -0.8),
            child: Container(
              width: screenHeight,
              height: screenHeight,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  borderRadius: BorderRadius.circular(screenHeight / 2)),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Text(
              'Profile',
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            )),
        ProfileDetails("assets/img/Me.jpg", "David Avendaño\n",
            " d.avendano.c@hotnmail.com")
      ],
    );
  }
}
