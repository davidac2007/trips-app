import 'package:flutter/material.dart';
import 'package:trips_app/place/ui/widgets/trips_cupertino.dart';
import 'package:trips_app/user/ui/screens/profile.dart';
import 'package:trips_app/place/ui/screens/search_trips.dart';

import 'place/ui/screens/home_trips.dart';

class Trips extends StatefulWidget {
  @override
  _TripsState createState() {
    return _TripsState();
  }
}

class _TripsState extends State<Trips> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    Profile(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: TripsCupertino(),
      // Theme(
      //   data: Theme.of(context)
      //       .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
      //   child: BottomNavigationBar(
      //     currentIndex: indexTap,
      //     onTap: onTapTapped,
      //     items: [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      //       BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      //     ],
      //   ),
      // ),
    );
  }
}