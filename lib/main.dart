import 'package:first_app/screens/home_screen/home_screen.dart';
import 'package:first_app/screens/player_screen/player_screen.dart';
import 'package:first_app/screens/side_menu/side_menu.dart';
import 'package:first_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

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
          primarySwatch: const MaterialColor(0xFFF51E38, {
            50: Color.fromRGBO(245, 30, 56, .1),
            100: Color.fromRGBO(245, 30, 56, .2),
            200: Color.fromRGBO(245, 30, 56, .3),
            300: Color.fromRGBO(245, 30, 56, .4),
            400: Color.fromRGBO(245, 30, 56, .5),
            500: Color.fromRGBO(245, 30, 56, .6),
            600: Color.fromRGBO(245, 30, 56, .7),
            700: Color.fromRGBO(245, 30, 56, .8),
            800: Color.fromRGBO(245, 30, 56, .9),
            900: Color.fromRGBO(245, 30, 56, 1),
          }),
          fontFamily: "Mulish"),
      home: SplashScreen(),
    );
  }
}