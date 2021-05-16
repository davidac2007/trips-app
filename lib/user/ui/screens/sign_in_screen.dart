import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/ui/widgets/gradient_back.dart';
import 'package:trips_app/place/ui/widgets/trips_cupertino.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/ui/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInGoogleScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignInGoogleScreen();
  }
}

class _SignInGoogleScreen extends State<SignInGoogleScreen> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData ||
              snapshot.hasError ||
              FirebaseAuth.instance.currentUser == null) {
            print("Not logged out");
            return signInGoogleUI();
          } else {
            return TripsCupertino();
          }
        });
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
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 36.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              GoogleButton(
                text: "Sign in with Google",
                onPressed: () {
                  userBloc.signIn().then((UserCredential user) =>
                      print("User is ${user.user.displayName}"));
                },
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
