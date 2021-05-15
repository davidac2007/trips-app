import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          // Change password
          CircleButton(
              true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6)),
          // Add new place
          CircleButton(false, Icons.add, 40.0, Color(0xFFFFFFFF)),
          // Log outs
          CircleButton(true, Icons.exit_to_app, 20.0,
              Color.fromRGBO(255, 255, 255, 0.6)),
        ]));
  }
}

class CircleButton extends StatefulWidget {
  final bool mini;
  final icon;
  final double iconSize;
  final Color color;

  CircleButton(this.mini, this.icon, this.iconSize, this.color);

  @override
  State<StatefulWidget> createState() {
    return _CircleButton();
  }
}

class _CircleButton extends State<CircleButton> {
  void onPressedButton() {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FloatingActionButton(
      backgroundColor: widget.color,
      mini: widget.mini,
      onPressed: onPressedButton,
      child: Icon(
        widget.icon,
        size: widget.iconSize,
        color: Color(0xFF4268D3),
      ),
    ));
  }
}
