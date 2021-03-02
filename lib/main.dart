import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Authentication/auth.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new AuthDriver(),
        title: new Text('Pick Up Driver',
          style: new TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 20.0


          ),

        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Color.fromRGBO(0, 143, 209, 1),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.white
    );
  }
}

