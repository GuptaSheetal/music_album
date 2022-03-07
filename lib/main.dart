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
          primarySwatch: const MaterialColor(0xFF2CE5DA, {
            50: Color.fromRGBO(44, 229, 218, .1),
            100: Color.fromRGBO(44, 229, 218, .2),
            200: Color.fromRGBO(44, 229, 218, .3),
            300: Color.fromRGBO(44, 229, 218, .4),
            400: Color.fromRGBO(44, 229, 218, .5),
            500: Color.fromRGBO(44, 229, 218, .6),
            600: Color.fromRGBO(44, 229, 218, .7),
            700: Color.fromRGBO(44, 229, 218, .8),
            800: Color.fromRGBO(44, 229, 218, .9),
            900: Color.fromRGBO(44, 229, 218, 1),
          }),
          fontFamily: "Mulish"),
      home: const SplashScreen(),
    );
  }
}