import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  AddPlaceScreen(this.image);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GradientBackk(300.0, ""),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
