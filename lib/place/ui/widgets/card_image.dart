import 'package:flutter/material.dart';

import 'floating_action_button.dart';

class CardImage extends StatelessWidget {
  CardImage({this.pathImage});
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: 420.0,
      width: 300.0,
      margin: EdgeInsets.only(top: 80.0, left: 20.0),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[card, FloatingActionButtonGreen()],
    );
  }
}
