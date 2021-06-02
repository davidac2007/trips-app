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
          imagePath: "https://avatars.githubusercontent.com/u/1071625?v=4",
          name: "Varuna Yasas",
          details: "1 review - 5 photos",
          comments: "There is an amazing place in Sri Lanka",
        ),
        Review(
          imagePath: FirebaseAuth.instance.currentUser.photoURL,
          name: FirebaseAuth.instance.currentUser.displayName,
          details: "2 reviews- 8 photos",
          comments: "There is an amazing place in Mexico",
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
