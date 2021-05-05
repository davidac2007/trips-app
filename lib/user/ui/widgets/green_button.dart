import 'package:flutter/material.dart';

class GreenButton extends StatefulWidget {
  GreenButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.width,
      this.height});

  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  State createState() {
    return _GreenButton();
  }
}

class _GreenButton extends State<GreenButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              colors: [Colors.grey[300], Colors.grey[400]],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/google.png",
              width: 30.0,
              height: 30.0,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 18.0, fontFamily: "Lato", color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
