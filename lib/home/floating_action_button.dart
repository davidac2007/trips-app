import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  bool fav = false;
  Icon notFavorite = Icon(
    Icons.favorite_border,
  );
  Icon inFavorite = Icon(
    Icons.favorite,
  );
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Favorite",
      child: fav ? inFavorite : notFavorite,
      onPressed: () {
        onPressedFav();
      },
    );
  }

  void onPressedFav() {
    setState(() {
      // Here we change the icon.
      fav = !fav;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1),
      content: Text("Added to favorites"),
      backgroundColor: Colors.deepPurple[900],
    ));
  }
}
