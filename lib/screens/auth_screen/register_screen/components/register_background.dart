import 'package:flutter/material.dart';

class RegisterBackground extends StatefulWidget {
  final Widget child;
  RegisterBackground({Key? key, 
  required this.child}) : super(key: key);

  @override
  State<RegisterBackground> createState() => _RegisterBackgroundState();
}

class _RegisterBackgroundState extends State<RegisterBackground> {
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
              child: Image.asset("assets/images/auth_images/signup_top.png"),
              height: screenwidth/3.80,
              width: screenwidth/3.50,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/auth_images/main_bottom.png"),
              height: screenwidth/3.60,
              width: screenwidth/5.20,
            ),
            widget.child,
          ],
        ),
    );
  }
}