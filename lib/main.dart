import 'package:first_app/screens/auth_screen/login_screen/login_screen.dart';
import 'package:first_app/screens/auth_screen/register_screen/register_screen.dart';
import 'package:first_app/screens/home_screen/home_screen.dart';
import 'package:first_app/screens/player_screen/player_screen.dart';
import 'package:first_app/screens/side_menu/side_menu.dart';
import 'package:first_app/screens/splash_screen/root_splash_screen.dart';
import 'package:first_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch:  const MaterialColor(0xFFB36DEA, {
            50: Color.fromRGBO(179, 109, 234, .1),
            100: Color.fromRGBO(179, 109, 234, .2),
            200: Color.fromRGBO(179, 109, 234, .3),
            300: Color.fromRGBO(179, 109, 234, .4),
            400: Color.fromRGBO(179, 109, 234, .5),
            500: Color.fromRGBO(179, 109, 234, .6),
            600: Color.fromRGBO(179, 109, 234, .7),
            700: Color.fromRGBO(179, 109, 234, .8),
            800: Color.fromRGBO(179, 109, 234, .9),
            900: Color.fromRGBO(179, 109, 234, 1),
          }),
          fontFamily: "Mulish"),
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RegisterScreen();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }
      ),
    );
  }
}