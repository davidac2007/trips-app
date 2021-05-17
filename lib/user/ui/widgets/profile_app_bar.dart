import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/user/ui/widgets/profile_buttons.dart';
import 'package:trips_app/user/ui/widgets/profile_details.dart';

class ProfileAppBar extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return null;
            case ConnectionState.done:
              return null;
          }
        },
        );

    // return Column(
    //   children: [
    //     ProfileTitle(),
    //     ProfileDetails(
    //         FirebaseAuth.instance.currentUser.photoURL,
    //         "${FirebaseAuth.instance.currentUser.displayName} \n",
    //         FirebaseAuth.instance.currentUser.email),
    //     ProfileButtons(),
    //   ],
    // );
  }

  Widget showProfileData(AsyncSnapshot snapshot){
    return 
  }
}
