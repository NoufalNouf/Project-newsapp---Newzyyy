import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newzy/projectloginpage.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:


        AnimatedSplashScreen(
          duration: 2000,
            backgroundColor: Colors.black,
            splash: Text("Newzyyy",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,color: Colors.white),),
            nextScreen: signup(),),





    );
  }
}
