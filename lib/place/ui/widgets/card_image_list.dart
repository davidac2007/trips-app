import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips_app/user/bloc/user_bloc.dart';

import 'card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        height: 350.0,
        child: StreamBuilder(
            stream: userBloc.placesStream,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
                case ConnectionState.active:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
                case ConnectionState.none:
                  return CircularProgressIndicator();
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
              }
            })

        // CardImage(
        //     pathImage: "assets/img/beach.jpeg",
        //     height: 420,
        //     width: 320,
        //     left: 20,
        //     iconData: Icons.favorite_border),

        );
  }

  Widget listViewPlaces(List<CardImage> placesCard) {
    return ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: placesCard);
  }
}
