import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/gradient_back.dart';
import 'package:trips_app/user/ui/widgets/green_button.dart';

class SignInGoogleScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInGoogleScreen();
  }
}

class _SignInGoogleScreen extends State<SignInGoogleScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              GreenButton(
                text: "Sign in with Google",
                onPressed: () {},
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
