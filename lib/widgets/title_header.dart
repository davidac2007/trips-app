import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;

  TitleHeader({this.title});

  @override
  Widget build(BuildContext context) {
    // final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: "Lato",
              fontWeight: FontWeight.bold)),
    );
  }
}
