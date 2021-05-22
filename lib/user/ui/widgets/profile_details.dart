import 'package:flutter/material.dart';
import 'package:trips_app/user/model/user.dart';

class ProfileDetails extends StatelessWidget {
  final UserModel user;
  ProfileDetails(this.user);

  @override
  Widget build(BuildContext context) {
    final photo = Container(
        margin: EdgeInsets.only(top: 40.0),
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(user.photoURL),
          backgroundColor: Colors.transparent,
        ));

    final profileDetails = Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Text.rich(TextSpan(children: [
          TextSpan(
              text: "${user.name} \n",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: "Lato")),
          TextSpan(
              text: user.email,
              style: TextStyle(
                  color: Colors.white24, fontSize: 14, fontFamily: "Lato"))
        ])));

    return Container(
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Flexible(child: photo),
          Flexible(child: profileDetails)
        ]));
  }
}
