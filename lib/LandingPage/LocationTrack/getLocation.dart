import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pickupdriver/LandingPage/LocationTrack/home.dart';
import 'package:pickupdriver/LandingPage/LocationTrack/user_location.dart';
import 'package:provider/provider.dart';



import 'locationservice.dart';



class GetLocation extends StatefulWidget {
  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  @override
  Widget build(BuildContext context) {

    var documentReference = FirebaseFirestore.instance
        .collection('Bus')
        .doc("GPS")
        .collection("GPS")
        .doc("latlng");
    // .document(DateTime.now().millisecondsSinceEpoch.toString());

    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        {
          'lat': -9.4543403,
          'lon': 147.1846744,

        },
      );
    });

    return StreamProvider<UserLocation>(
        create: (context) => LocationService().locationStream,
        child: MaterialApp(title: 'Flutter Demo', home: HomeView()));
  }

}