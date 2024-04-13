import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Firebase_Auth/splash_screen.dart';
 // Import your login screen file

 void main () async {
   WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
   } on Exception catch (e) {
     // TODO
   }
  runApp( MyApp());


 }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      home: SplashScreen(),
    );
  }
}