import 'package:flutter/material.dart';
import 'package:trips_app/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Review(
          "assets/img/people.jpg",
          "Varuna Yasas",
          "1 review - 5 photos",
          "There is an amazing place in Sri Lanka",
        ),
        Review(
          "assets/img/Me.jpg",
          "David Avendaño",
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
