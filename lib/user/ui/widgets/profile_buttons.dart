import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/ui/screens/add_place.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc;
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // Change password
          CircleButton(true, Icons.vpn_key, 20.0,
              Color.fromRGBO(255, 255, 255, 0.6), () => {}),
          // Add new place
          CircleButton(false, Icons.add, 40.0, Color(0xFFFFFFFF), () {
            File image;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddPlaceScreen(image)));
          }),
          // Log out
          CircleButton(
              true,
              Icons.exit_to_app,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
              () => {FirebaseAuth.instance.signOut(), userBloc.signOut()}),
        ]));
  }
}

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool mini;
  final icon;
  final double iconSize;
  final Color color;

  CircleButton(this.mini, this.icon, this.iconSize, this.color, this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: widget.onPressed,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
      heroTag: null,
    ));
  }
}
