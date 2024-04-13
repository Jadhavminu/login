import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){

    super.initState();
    // Timer(
    //   Duration(seconds: 5),
    //     ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
    //     (BuildContext context) => NextScreen())
    // )
    //
    // );

    Timer(
        const Duration(seconds: 4),
            ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
            (BuildContext context) =>LoginPage())
        )

    );



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500, // Adjust the width as desired
          height: 500, // Adjust the height as desired
          child: Image.asset('assets/Button.png'),
        ),

      ),
    );
  }
}