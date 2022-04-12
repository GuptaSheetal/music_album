import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginBackground extends StatefulWidget {
  final Widget child;
  const LoginBackground({
    Key? key, 
    required this.child,
  }) : super(key: key);

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: screenwidth,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/auth_images/main_top.png",
              height: screenwidth/3,
              width: screenwidth/3.50,)),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/auth_images/login_bottom.png",
              height: screenwidth/3.70,
              width: screenwidth/2.80,)),
           widget.child,
        ],
      ),
    );
  }
}