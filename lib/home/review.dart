import 'package:flutter/material.dart';

class Review extends StatelessWidget {
  Review(this.imagePath, this.name, this.details, this.comments);

  final String imagePath;
  final String name;
  final String details;
  final String comments;

  @override
  Widget build(BuildContext context) {
    final userComments = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        comments,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 13.0),
      ),
    );

    final rate = Container(
        child: Row(
      children: <Widget>[],
    ));

    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        details,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Lato",
            fontSize: 13.0,
            color: Color(0xFFa3a5a7),
            fontWeight: FontWeight.w900),
      ),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0),
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: TextStyle(fontFamily: "Lato", fontSize: 17.0),
      ),
    );

    final userDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        userName,
        Row(
          children: [userInfo, rate],
        ),
        userComments
      ],
    );

    final photo = Container(
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
    return Row(
      children: <Widget>[
        photo,
        userDetails,
      ],
    );
  }
}
