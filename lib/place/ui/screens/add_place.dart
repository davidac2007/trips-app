import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/widgets/text_input.dart';
import 'package:trips_app/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final File image;

  AddPlaceScreen({this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerPlaceTitle = TextEditingController();
    final _controllerPlaceDescription = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBackk(height: 300.0, title: "", align: 60.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 28.0, left: 5.0),
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
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                  child: TitleHeader(title: "Add new place"),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                Container(),
                Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: TextInput(
                        hintText: "Title",
                        inputType: null,
                        controller: _controllerPlaceTitle,
                        maxLines: 1)),
                TextInput(
                    hintText: "Description",
                    inputType: TextInputType.multiline,
                    controller: _controllerPlaceDescription,
                    maxLines: 4)
              ],
            ),
          )
        ],
      ),
    );
  }
}
