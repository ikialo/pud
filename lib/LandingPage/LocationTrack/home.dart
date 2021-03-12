import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:pickupdriver/LandingPage/LocationTrack/user_location.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    UserLocation userLocation = Provider.of<UserLocation>(context);
    UpdateFireLatLng(userLocation);


    return Scaffold(
      body: Stack(
          children: <Widget>[



            Center(

              child: Text(
                  'Location: Lat:${userLocation.lat}, Long: ${userLocation.lon}'),
            ),
          ]),
      floatingActionButton: FloatingActionButton(onPressed: () {

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) =>
        //             MapView()));
      },),
    );
  }


  Future<void> UpdateFireLatLng( UserLocation userLocation) async {
    try {
      await FirebaseFirestore.instance.collection('Bus').doc("GPS").collection("GPS").doc("latlng").update({
        'lat': userLocation.lat,
        'lon': userLocation.lon
      });
    } catch (e) {
      print(e.toString());
    }
  }
}