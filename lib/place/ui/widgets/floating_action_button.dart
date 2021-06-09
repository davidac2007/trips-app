import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({this.iconData, this.onPressed});
  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool fav = false;
  Icon iconData = Icon(
    Icons.favorite_border,
  );
  Icon inFavorite = Icon(
    Icons.favorite,
  );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: null,
        backgroundColor: Color(0xFF11DA53),
        mini: true,
        tooltip: "Favorite",
        child: Icon(widget.iconData),
        onPressed: widget.onPressed);
  }

  // void onPressedFav() {
  //   setState(() {
  //     // Here we change the icon.
  //     fav = !fav;
  //     print("Done");
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     duration: Duration(seconds: 1),
  //     content: Text("Added to favorites"),
  //     backgroundColor: Colors.deepPurple[900],
  //   ));
  // }
}
