import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomBarItem extends StatelessWidget {
  //const BottomBarItem({Key? key}) : super(key: key);

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  BottomBarItem(
     this.text,
     this.icon, 
     this.isSelected, 
     this.onTap
    );

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: isSelected ? primaryColor : Colors.black38,
            size: screenwidth/16.62 ,),
            Text(text, style: TextStyle(
              color: isSelected ? primaryColor : Colors.black38,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              fontSize: screenwidth/35.667,
            ),)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
