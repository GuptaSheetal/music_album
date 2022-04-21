import 'package:flutter/material.dart';
import 'package:first_app/constants/constants.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BuildSideBar extends StatefulWidget {
  BuildSideBar({Key? key}) : super(key: key);

  @override
  State<BuildSideBar> createState() => _BuildSideBarState();
}

class _BuildSideBarState extends State<BuildSideBar> {

  final _advancedDrawerController = AdvancedDrawerController();
  final tabs = ['Songs', 'Album', 'Artist', 'Favourite','Recent History','Sign Out'];
  int selectedPosition = 0;


  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return 
    
    // AdvancedDrawer(
    //   backdropColor: Colors.white,
    //   controller: _advancedDrawerController,
    //   animationCurve: Curves.easeInOut,
    //   animationDuration: const Duration(milliseconds: 300),
    //   animateChildDecoration: true,
    //   openRatio: 0.5,
    //   rtlOpening: false,
    //   disabledGestures: false,
    //   childDecoration: BoxDecoration(  
    //     border: Border.all(),
    //    // borderRadius: BorderRadius.all(Radius.circular(16)),
    //   ),
    //   child: Scaffold(),
    //   drawer: SafeArea(
    //     child: Container(
    //       child: ListTileTheme(
    //         // textColor: Colors.black,
    //         // iconColor: Colors.black,
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Container(
    //               margin: EdgeInsets.fromLTRB(
    //                   0, screenwidth / 5.74, 0, screenwidth / 7.94),
    //               decoration: BoxDecoration(
    //                 color: primaryColor,
    //                 borderRadius: BorderRadius.only(
    //                     topRight: Radius.circular(screenwidth / 37.5),
    //                     bottomRight: Radius.circular(screenwidth / 37.5)),
    //               ),
    //               child: ListTile(
    //                 leading: Container(
    //                   decoration: BoxDecoration(
    //                     image: DecorationImage(
    //                       image: AssetImage("assets/images/side_bar.jpg"),
    //                       fit: BoxFit.cover,
    //                     ),
    //                     borderRadius:
    //                         BorderRadius.circular(screenwidth / 11.02),
    //                   ),
    //                   height: screenwidth / 11.02,
    //                   width: screenwidth / 11.02,
    //                 ),
    //                 title: Text("Shinchan",
    //                     style: TextStyle(
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: screenwidth / 30.6)),
    //                 subtitle: Row(
    //                   children: [
    //                     Icon(
    //                       TablerIcons.crown,
    //                       color: Colors.white38,
    //                       size: screenwidth / 30.5,
    //                     ),
    //                     SizedBox(
    //                       width: screenwidth / 55,
    //                     ),
    //                     Text(
    //                       "Premium",
    //                       style: TextStyle(
    //                           fontSize: screenwidth / 32.5,
    //                           color: Colors.white38),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               height: screenwidth / 5.95,
    //               width: screenwidth / 1.20,
    //             ),
       Column(
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
     // ),
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