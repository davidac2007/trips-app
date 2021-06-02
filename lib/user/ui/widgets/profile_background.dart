import 'package:flutter/material.dart';

class GradientBackk extends StatelessWidget {
  final double height;
  final String title;
  final double align;
  GradientBackk({this.height, this.title, this.align});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      Container(
        width: screenWidth,
        height: height,
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
          margin: EdgeInsets.only(left: align, right: 20.0, top: 35.0),
          child: Text(
            title,
            style: TextStyle(
                fontFamily: 'Lato',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35.0),
          )),
    ]);
  }
}
