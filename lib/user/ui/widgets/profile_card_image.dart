import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/floating_action_button.dart';
import 'package:trips_app/place/model/place.dart';

class ProfileCardImage extends StatelessWidget {
  ProfileCardImage(
      this.pathImage, this.name, this.descrption, this.steps, this.place);
  final String pathImage;
  final String name;
  final String descrption;
  final String steps;
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    final image = Stack(alignment: Alignment(0.0, 0.8), children: [
      Container(
        height: 200.0,
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pathImage), fit: BoxFit.cover),
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
          height: 120.0,
          width: MediaQuery.of(context).size.width * 0.680,
          margin:
              EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
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
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: ListView(children: [
              Text(this.place.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(this.place.description,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "Lato")),
              SizedBox(
                height: 10,
              ),
              Text('${this.place.likes}',
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 12,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
            ]),
          )),
      FloatingActionButtonGreen()
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
