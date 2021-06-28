import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/place/model/place.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';
import 'package:trips_app/user/ui/widgets/profile_app_bar.dart';

class ProfileCardImageList extends StatelessWidget {
  final PlaceModel place = PlaceModel(
    id: "",
    name: "Knuckles Mountains Range",
    description: "Hiking. Water fall hunting. Natural bath",
    likes: 3,
    uriImage:
        "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  );
  final PlaceModel place2 = PlaceModel(
    id: "",
    name: "Mountains",
    description:
        "Hiking. Water fall hunting. Natural bath', 'Scenery & Photography",
    likes: 10,
    uriImage:
        "https://images.unsplash.com/photo-1524654458049-e36be0721fa2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
  );
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 40.0, top: 85.0),
      height: double.infinity,
      child: Expanded(
        child: ListView(children: [
          ProfileAppBar(),
          StreamBuilder(
              stream: userBloc.placesStream,
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.done:
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          children: userBloc.buildMyPlaces(snapshot.data.docs)),
                    );
                  case ConnectionState.active:
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          children: userBloc.buildMyPlaces(snapshot.data.docs)),
                    );
                  case ConnectionState.none:
                    return CircularProgressIndicator();
                  default:
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          children: userBloc.buildMyPlaces(snapshot.data.docs)),
                    );
                }
              }),
        ]),
      ),

      // ListView(
      //   padding: EdgeInsets.all(20.0),
      //   scrollDirection: Axis.vertical,
      //   children: <Widget>[
      //     ProfileAppBar(),
      //     ProfileCardImage(place: place),
      //     ProfileCardImage(place: place2),
      //     SizedBox(height: 30.0)
      //   ],
      // ),
    );
  }
}
