import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sukoon_setu/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Make background transparent to show the image
      body: Container(
        width: double.infinity,
        height: double.infinity, // Ensure the container fills the screen
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(
        //       "assets/pics/bg.png",
        //     ), // Path to your background image
        //     fit: BoxFit.cover, // Make sure the image covers the whole screen
        //   ),
        // ),
        child: Center(child: Image.asset("assets/logos/heart.png",width: MediaQuery.of(context).size.width*0.4,)),
      ),
    );
  }
}