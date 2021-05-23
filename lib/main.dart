import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trips_app/user/ui/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        []); //Make status bar transparent in Android

    return BlocProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(),
            home:
                // SignInGoogleScreen()
                SignInGoogleScreen()),
        bloc: UserBloc());
  }
}
