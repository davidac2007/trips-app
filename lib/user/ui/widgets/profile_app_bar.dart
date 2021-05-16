import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/user/ui/widgets/profile_background.dart';
import 'package:trips_app/user/ui/widgets/profile_buttons.dart';
import 'package:trips_app/user/ui/widgets/profile_details.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTitle(),
        ProfileDetails(
            FirebaseAuth.instance.currentUser.photoURL,
            "${FirebaseAuth.instance.currentUser.displayName} \n",
            FirebaseAuth.instance.currentUser.email),
        ProfileButtons(),
      ],
    );
  }
}
