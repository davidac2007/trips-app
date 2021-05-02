import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/floating_action_button.dart';

class ProfileCardImage extends StatelessWidget {
  ProfileCardImage(this.pathImage, this.name, this.email, this.steps);
  final String pathImage;
  final String name;
  final String email;
  final String steps;

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
          height: 105.0,
          width: MediaQuery.of(context).size.width * 0.650,
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(email,
                  style: TextStyle(
                      color: Colors.grey, fontSize: 12, fontFamily: "Lato")),
              SizedBox(
                height: 10,
              ),
              Text(steps,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 14,
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
