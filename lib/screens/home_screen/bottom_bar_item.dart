import 'package:first_app/constants/constants.dart';
import 'package:flutter/material.dart';

class BuildBottomBar extends StatefulWidget {
  BuildBottomBar({Key? key}) : super(key: key);

  @override
  State<BuildBottomBar> createState() => _BuildBottomBarState();
}

final tabs = ['Home', 'TV', 'Radio', 'Notification'];
int selectedPosition = 0;
class _BuildBottomBarState extends State<BuildBottomBar> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              BottomBarItem(tabs[0], Icons.home, selectedPosition == 0, () {
                setState(() {
                  selectedPosition = 0;
                });
              }),
              SizedBox(
                width: screenwidth / 7.13,
              ),
              BottomBarItem(tabs[1], Icons.tv, selectedPosition == 1, () {
                setState(() {
                  selectedPosition = 1;
                });
              }),
            ],
          ),
          Row(
            children: [
              BottomBarItem(tabs[2], Icons.radio, selectedPosition == 2, () {
                setState(() {
                  selectedPosition = 2;
                });
              }),
              SizedBox(
                width: screenwidth / 12.13,
              ),
              BottomBarItem(tabs[3], Icons.notifications, selectedPosition == 3,
                  () {
                setState(() {
                  selectedPosition = 3;
                });
              })
            ],
          )
        ],
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {

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
