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
    Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: SafeArea(
             child: Column(
              children: [
                Expanded(
                  child: Container()),
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/images/app_logo.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Task Manager",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
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

