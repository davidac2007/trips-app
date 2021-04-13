import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trips_app/trips.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        []); //Make status bar transparent in Android

    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(), home: Trips());
  }
}
