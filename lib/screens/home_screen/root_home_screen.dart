import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/Notification_screen/notification_screen.dart';
import 'package:first_app/screens/Radio_screen/radio_screen.dart';
import 'package:first_app/screens/home_screen/home_screen.dart';
import 'package:first_app/screens/home_screen/sub_screens/build_bottom_bar.dart';
import 'package:first_app/screens/tv_screen/tv_screen.dart';
import 'package:flutter/material.dart';

class RootHomeScreen extends StatefulWidget {
  RootHomeScreen({Key? key}) : super(key: key);

  @override
  State<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends State<RootHomeScreen> {

  final pages = <Widget>[
        HomeScreen(),
        TvScreen(),
        RadioScreen(),
        NotificationScreen()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BuildBottomBar(
        index: index,
        onChangedTab: onChangedTab,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(Icons.rocket),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }

}

