import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review(
          "https://avatars.githubusercontent.com/u/1071625?v=4",
          "Varuna Yasas",
          "1 review - 5 photos",
          "There is an amazing place in Sri Lanka",
        ),
        Review(
          FirebaseAuth.instance.currentUser.photoURL,
          FirebaseAuth.instance.currentUser.displayName,
          "2 reviews- 8 photos",
          "There is an amazing place in Mexico",
        ),
        // Review(
        //   "assets/img/sophie.jpg",
        //   "Sofía Radillo",
        //   "10 reviews- 3 photos",
        //   "There is an amazing place in USA",
        // )
      ],
    );
  }
}
