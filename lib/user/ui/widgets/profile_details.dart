import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails(this.imagePath, this.name, this.email);
  final String imagePath;
  final String name;
  final String email;
  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(top: 50.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white),
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );

    final profileDetails = Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: name,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: "Lato")),
          TextSpan(
              text: email,
              style: TextStyle(
                  color: Colors.white24, fontSize: 16, fontFamily: "Lato"))
        ])));

    return Container(
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [photo, profileDetails]));
  }
}
