import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
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
          CircleButton(
              mini: true,
              icon: Icons.vpn_key,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () => {}),
          // Add new place
          CircleButton(
              mini: false,
              icon: Icons.add,
              iconSize: 40.0,
              color: Color(0xFFFFFFFF),
              onPressed: () async {
                final picker = ImagePicker();
                picker
                    .getImage(source: ImageSource.camera)
                    .then((PickedFile image) {
                  if (image != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => AddPlaceScreen(
                                image: image != null
                                    ? File(image.path)
                                    : File("assets/img/no_image.png"))));
                  } else {}
                }).catchError((onError) => print(onError));
              }),
          // Log out
          CircleButton(
              mini: true,
              icon: Icons.exit_to_app,
              iconSize: 20.0,
              color: Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () =>
                  {FirebaseAuth.instance.signOut(), userBloc.signOut()}),
        ]));
  }
}

class CircleButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool mini;
  final icon;
  final double iconSize;
  final Color color;

  CircleButton(
      {this.mini, this.icon, this.iconSize, this.color, this.onPressed});

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
