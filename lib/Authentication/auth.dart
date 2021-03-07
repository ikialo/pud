import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'signin.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthDriver extends StatefulWidget {
  @override
  _AuthDriverState createState() => _AuthDriverState();
}

class _AuthDriverState extends State<AuthDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Driver'),
        backgroundColor: Color.fromRGBO(0, 143, 209, 1),
        shadowColor: Colors.black26,
//         actions: <Widget>[
//           Builder(builder: (BuildContext context) {
// //5
//             return FlatButton(
//               child: const Text('Sign out'),
//               textColor: Theme
//                   .of(context)
//                   .buttonColor,
//               onPressed: () async {
//                 final User user = _auth.currentUser;
//
//
//                 if (user == null) {
//                   Scaffold.of(context).showSnackBar(const SnackBar(
//                     content: Text('No one has signed in.'),
//                   ));
//                   return;
//                 }
//                 await _auth.signOut();
//                 final String uid = user.uid;
//                 Scaffold.of(context).showSnackBar(SnackBar(
//                   content: Text(uid + ' has successfully signed out.'),
//                 ));
//               },
//             );
//           })
//         ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
          child:Container(
        padding: EdgeInsets.all(25.0),
        child: EmailPasswordForm()
      ),
      )

    );
  }
}


