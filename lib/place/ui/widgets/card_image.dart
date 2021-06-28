import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'floating_action_button.dart';

class CardImage extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;
  final double left;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;

  CardImage({
    this.pathImage,
    this.height,
    this.width,
    this.left,
    this.iconData,
    this.onPressedFabIcon,
  });
  @override
  Widget build(BuildContext context) {
    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: 80.0, left: left),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: pathImage,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
