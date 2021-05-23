import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/model/user.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/user/ui/widgets/profile_buttons.dart';
import 'package:trips_app/user/ui/widgets/profile_details.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return showProfileData(snapshot);
          case ConnectionState.none:
            return showProfileData(snapshot);
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
        return showProfileData(snapshot);
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("Not logged in");
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProgressIndicator(),
            Text("Couldn't get the data. Please log in")
          ]);
    } else {
      print(snapshot.data);
      final user = UserModel(snapshot.data.uid, snapshot.data.displayName,
          snapshot.data.email, snapshot.data.photoURL, null, null);
      print("Logged in");
      return Column(
        children: [
          ProfileTitle(),
          ProfileDetails(user),
          ProfileButtons(),
        ],
      );
    }
  }
}
