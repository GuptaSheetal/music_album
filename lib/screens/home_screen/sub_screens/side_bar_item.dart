import 'package:flutter/material.dart';
import 'package:first_app/constants/constants.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class BuildSideBar extends StatefulWidget {
  BuildSideBar({Key? key}) : super(key: key);

  @override
  State<BuildSideBar> createState() => _BuildSideBarState();
}

final tabs = ['Songs', 'Album', 'Artist', 'Favourite','Recent History','Sign Out'];
int selectedPosition = 0;

class _BuildSideBarState extends State<BuildSideBar> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SideBarItem(tabs[0], Icons.music_note, selectedPosition == 0, () {
            setState(() {
              selectedPosition = 0;
            });
        }),
        SizedBox(
          height: screenwidth / 16.13,
        ),
        SideBarItem(tabs[1], Icons.album, selectedPosition == 1, () {
            setState(() {
              selectedPosition = 1;
            });
        }),
        SizedBox(
          height: screenwidth / 16.13,
        ),
        SideBarItem(tabs[2], Icons.person, selectedPosition == 2, () {
            setState(() {
              selectedPosition = 2;
            });
        }),
        SizedBox(
          height: screenwidth / 16.13,
        ),
        SideBarItem(tabs[3], Icons.favorite, selectedPosition == 3, () {
            setState(() {
              selectedPosition = 3;
            });
        }),
        SizedBox(
          height: screenwidth / 16.13,
        ),
        SideBarItem(tabs[4], Icons.history, selectedPosition == 4, () {
            setState(() {
              selectedPosition = 4;
            });
        }),     
        SizedBox(
          height: screenwidth / 6.13,
        ),
        SideBarItem(tabs[5], Icons.logout, selectedPosition == 5, () {
            setState(() {
              selectedPosition = 5;
            });
        }),
      ],
    );
  }
}

class SideBarItem extends StatelessWidget {

  final String text;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  SideBarItem(
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
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Row(
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: isSelected ? primaryColor : Colors.black38,
            size: screenwidth/14.62 ,),
            SizedBox(
              width: screenwidth/18.13,
            ),
            Text(text, style: TextStyle(
              color: isSelected ? primaryColor : Colors.black38,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: screenwidth/23.667,
            ),)
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}