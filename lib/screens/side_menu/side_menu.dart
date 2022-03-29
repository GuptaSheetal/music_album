import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        //padding: EdgeInsets.zero,
          children: <Widget>[
            // SizedBox(
            //   height: screenwidth/4.74,
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(0, screenwidth/5.74, 130, 0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(screenwidth/37.5),
              ),
              height: screenwidth/5.95,
              width: screenwidth/2.07,
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
            ListTile(
              leading: 
              Icon(Icons.music_note),
              title: Text("Profile"),
            ),
        ]
      ),
    );
  }
}