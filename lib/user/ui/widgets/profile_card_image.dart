import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/floating_action_button.dart';
import 'package:trips_app/place/model/place.dart';

class ProfileCardImage extends StatelessWidget {
  ProfileCardImage({this.place});

  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    final image = Stack(alignment: Alignment(0.0, 0.8), children: [
      Container(
        height: 250.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(place.uriImage), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 7.0))
            ]),
      ),
    ]);

    final info = Stack(alignment: Alignment(0.7, 1.0), children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.160,
          width: MediaQuery.of(context).size.width * 0.685,
          margin:
              EdgeInsets.only(top: 20.0, left: 10.0, right: 20.0, bottom: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              shape: BoxShape.rectangle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.black38,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 7.0))
              ]),
          child: Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(place.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(place.description,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontFamily: "Lato")),
                  Flexible(
                    child: Text('${place.likes} likes',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 14,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold)),
                  ),
                ]),
          )),
      FloatingActionButtonGreen(
        iconData: Icons.favorite_border,
      )
    ]);

    return Column(
      children: [
        Stack(
          alignment: Alignment(0.14, 2),
          children: <Widget>[
            image,
            info,
          ],
        ),
        SizedBox(height: 50.0),
      ],
    );
  }
}
