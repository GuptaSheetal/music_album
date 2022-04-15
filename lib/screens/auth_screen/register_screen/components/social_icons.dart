import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcons extends StatelessWidget {
  final String iconSrc;
  final VoidCallback onPress;
  const SocialIcons({
    Key? key,
    required this.screenwidth, 
    required this.iconSrc, 
    required this.onPress,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenwidth/30),
        padding: EdgeInsets.all(screenwidth/35),
        child: Image(image: AssetImage(iconSrc),),
        decoration: BoxDecoration(  
          color: Colors.white,        
          border: Border.all(
            width: 2,
            color: primaryColor,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0,5),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.25)
            )
          ],
          shape: BoxShape.circle,
        ),
        height: screenwidth/8,
        width: screenwidth/8
        ),
     // ),
    );
  }
}
