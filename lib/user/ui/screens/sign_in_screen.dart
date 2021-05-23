import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/ui/widgets/trips_cupertino.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/ui/widgets/google_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ProfileBackground(screenHeight * 120),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  "Welcome \n This is your Travel App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              GoogleButton(
                text: "Sign in with Google",
                width: 300.0,
                height: 50.0,
                onPressed: () {
                  try {
                    userBloc.signIn().then((UserCredential user) {
                      final _user = user.user;
                      userBloc.updateUserData(UserModel(
                          _user.uid,
                          _user.displayName,
                          _user.email,
                          _user.photoURL,
                          null,
                          null));
                    });
                  } catch (e) {}
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
