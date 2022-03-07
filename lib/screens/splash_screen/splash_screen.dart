import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:first_app/screens/auth_screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child:BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: SafeArea(
             child: Column(
              children: [
                Expanded(
                  child: Container()),
                  CircleAvatar(
                    radius: (screenwidth/2.76)/2,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage("assets/images/app_logo.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Task Manager",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenwidth/20.7,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                    flex: 3,
                  ),
              ],
             ) 
          ),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              "assets/images/splash_background.jpeg"
              ))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

