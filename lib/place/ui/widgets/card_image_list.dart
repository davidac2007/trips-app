import 'package:flutter/material.dart';

import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(
              pathImage: "assets/img/beach.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
          CardImage(
              pathImage: "assets/img/beach_palm.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
          CardImage(
              pathImage: "assets/img/mountain.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
          CardImage(
              pathImage: "assets/img/mountain_stars.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
          CardImage(
              pathImage: "assets/img/river.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
          CardImage(
              pathImage: "assets/img/sunset.jpeg",
              height: 420,
              width: 320,
              left: 20,
              iconData: Icons.favorite_border),
        ],
      ),
    );
  }
}
