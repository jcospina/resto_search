import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:restaurant_search/screens/home.screen.dart';

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FutureBuilder(
    future: _initialization,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return RestoApp();
      } else {
        return Loading();
      }
    },
  ));
}
