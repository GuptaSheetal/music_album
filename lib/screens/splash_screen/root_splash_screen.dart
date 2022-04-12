import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RootSplashScreen extends StatefulWidget {
  RootSplashScreen({Key? key}) : super(key: key);

  @override
  State<RootSplashScreen> createState() => _RootSplashScreenState();
}

class _RootSplashScreenState extends State<RootSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/app_logo.gif"),
                  fit: BoxFit.fill,
                ),
              ),
              height: screenwidth / 2,
              width: screenwidth / 1.50,
            ),
            Text(
              "Music Album",
              style: TextStyle(
                color: primaryColor,
                fontSize: screenwidth / 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
