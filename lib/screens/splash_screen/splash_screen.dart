import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
     // drawer: SideMenu(),
      body: Column(
        children: [
          Container(
            child: SafeArea(
                child: Column(
                  children: [
                     Container(
                       //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                       child: Carousel(
                         dotSize: 4.5,
                         dotSpacing: 15.0,
                         dotIncreasedColor: primaryColor,
                         dotColor: Color.fromARGB(178, 201, 34, 216),
                         indicatorBgPadding: 5.0,
                         dotBgColor: Colors.transparent,
                         dotPosition: DotPosition.bottomCenter,
                         images: [                                                     
                           SvgPicture.asset("assets/images/splash_image1.svg"),
                           SvgPicture.asset("assets/images/splash_image2.svg"),
                           SvgPicture.asset("assets/images/splash_image3.svg"),                           
                         ],
                       ),
                          height: screenwidth / 1.02,
                          width: screenwidth,
                     ),
                    SizedBox(
                      height: screenwidth / 8.86,
                    ),
                    Container(
                      //margin: EdgeInsets.only(right: screenwidth/25),
                      child: Text(
                        "Listening and watching Anytime,\nAnywhere",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: screenwidth/18.28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenwidth / 50,
                    ),
                    Container(
                     // margin: EdgeInsets.only(right: screenwidth/7),
                      child: Text(
                        "The artists we represent are one of the most\nsuccessful in Romania and also were a huge\nbreakthrough.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: screenwidth/23.78,
                        ),
                        ),
                    ),
                    SizedBox(
                      height: screenwidth / 5.80,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                            },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(180, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
                          children: [
                            Text(
                              "GET START",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: screenwidth/18.6,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              child: Icon(Icons.arrow_forward_sharp,
                              size: screenwidth/10.7,
                              color: Colors.white,),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(screenwidth/85.6),
                              ),
                              height: screenwidth/10.7,
                              width: screenwidth/8.56,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
            )),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
