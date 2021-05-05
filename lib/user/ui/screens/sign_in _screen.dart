import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/gradient_back.dart';

class SignInWithGoogle extends StatefulWidget {
  @override
  State createState() {
    return _SignInWithGoogle();
  }
}

class _SignInWithGoogle extends State<SignInWithGoogle> {
  @override
  Widget build(BuildContext context) {
    return SignInWithGoogle();
  }

  Widget signInWithGoogle() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(""),
          Column(
            children: [
              Text("Welcome \n To Trips App",
                  style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
