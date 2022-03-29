import 'dart:core';

import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/player_screen/player_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/models/playlist.dart';
import 'package:first_app/models/songs.dart';
import 'package:first_app/screens/home_screen/bottom_bar_item.dart';
import 'package:first_app/screens/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final tabs = ['Home', 'TV', 'Radio', 'Notification'];

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();
  int selectedPosition = 0;

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }

// @override
//   void initState() {
//     Future.delayed(
//         Duration.zero,
//         () => context._build
//     super.initState();
//   }

  // int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return AdvancedDrawer(
      backdropColor: Colors.white,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.black38,
            iconColor: Colors.black38,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // SingleChildScrollView(
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, screenwidth / 5.74, 110, screenwidth / 7.94),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(screenwidth / 37.5),
                        bottomRight: Radius.circular(screenwidth / 37.5)),
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/arrow.jpg"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                            BorderRadius.circular(screenwidth / 18.75),
                      ),
                      height: screenwidth / 11.02,
                      width: screenwidth / 9.61,
                    ),
                    title: Text("AF Shinchan",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth / 30.6)),
                    subtitle: Row(
                      children: [
                        Icon(
                          TablerIcons.crown,
                          color: Colors.white38,
                          size: screenwidth / 30.5,
                        ),
                        SizedBox(
                          width: screenwidth / 55,
                        ),
                        Text(
                          "Premium",
                          style: TextStyle(
                              fontSize: screenwidth / 32.5,
                              color: Colors.white38),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   //  child: Image(
                  //   //    image: AssetImage("assets/images/splash_image1.png"),

                  //   //   ),
                  //   decoration: BoxDecoration(

                  //     color: Colors.blue,
                  //     borderRadius: BorderRadius.circular(screenwidth/18.75),
                  //   ),
                  //   height: screenwidth/11.02,
                  //   width: screenwidth/9.61,
                  // )
                  // ),
                  height: screenwidth / 5.95,
                  width: screenwidth / 1.20,
                ),

                //Container(
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.home,
                    //color: Colors.black38
                  ),
                  title: Text(
                    'Home',
                    // style: TextStyle(
                    //   color: Colors.black38),
                  ),
                ),

                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.account_circle_rounded,
                    //color: Colors.black38
                  ),
                  title: Text(
                    'Profile',
                    // style: TextStyle(
                    //     color: Colors.black38),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.favorite,
                    //color: Colors.black38
                  ),
                  title: Text(
                    'Favourites',
                    // style: TextStyle(
                    //     color: Colors.black38),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.settings,
                    //color: Colors.black38
                  ),
                  title: Text(
                    'Settings',
                    // style: TextStyle(
                    //     color: Colors.black38),
                  ),
                ),
                // ListTile(
                //   onTap: () {},
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                // ),
                // ListTile(
                //   onTap: () {},
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                // ),
                // ListTile(
                //   onTap: () {},
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                // ),
                // ListTile(
                //   onTap: () {},
                //   leading: Icon(Icons.settings),
                //   title: Text('Settings'),
                // ),
                //),
                SizedBox(
                  height: screenwidth / 3.125,
                ),
                //Spacer(),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.logout,
                    //color: Colors.blue
                  ),
                  title: Text(
                    'Sign Out',
                    // style: TextStyle(
                    //     color: Colors.black38),
                  ),
                ),
                // DefaultTextStyle(
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Colors.white54,
                //   ),
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(
                //       vertical: 16.0,
                //     ),
                //     child: Text('Terms of Service | Privacy Policy'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        // drawer: SideMenu(),
        body: Column(
          children: [
            Container(
              child: _homeHeader(screenwidth, context, _scaffoldKey,
                  _advancedDrawerController, _handleMenuButtonPressed),
            ),
            Container(
              child: _buildPlaylistAndSongs(screenwidth),
            ),
            //  _buildBottomBar(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: Icon(Icons.rocket),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomBar(screenwidth),
      ),
    );
  }

//SchedulerBinding.instance.addPostFrameCallback((_) {

  // Your Code Here

  _buildBottomBar(double screenwidth) {
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

Widget _homeHeader(
    double screenwidth,
    BuildContext context,
    GlobalKey<ScaffoldState> _scaffoldKey,
    AdvancedDrawerController advancedDrawerController,
    VoidCallback _handleMenuButtonPressed) {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            Container(
              // alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20, 30, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    alignment: Alignment.centerLeft,
                    onPressed: _handleMenuButtonPressed,
                    icon: ValueListenableBuilder<AdvancedDrawerValue>(
                      valueListenable: advancedDrawerController,
                      builder: (_, value, __) {
                        return AnimatedSwitcher(
                          duration: Duration(milliseconds: 250),
                          child: Icon(
                            value.visible ? Icons.clear : Icons.menu,
                            key: ValueKey<bool>(value.visible),
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "#TRENDING",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenwidth / 42.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: screenwidth / 61.14,
                  ),
                  Text(
                    "Akcent feat Lidia\nBuble...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenwidth / 15.28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenwidth / 61.14,
                  ),
                  Text(
                    "-Kamelia",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenwidth / 26.75,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: screenwidth / 15.95,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "PLAY",
                              //textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenwidth / 42.8,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.red,
                              size: screenwidth / 23.777,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenwidth / 85.6),
                        ),
                        height: screenwidth / 19.45,
                        width: screenwidth / 6.90,
                      ),
                      SizedBox(
                        width: screenwidth / 53.5,
                      ),
                      Container(
                        child: Icon(
                          Icons.share_outlined,
                          color: Colors.red,
                          size: screenwidth / 23.777,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenwidth / 142.666),
                        ),
                        height: screenwidth / 19.45,
                        width: screenwidth / 17.833,
                      ),
                    ],
                  ),
                ],
              ),
              height: screenwidth / 1.73,
              width: screenwidth / 1.8,
            ),
            //   Container(
            //     child: SvgPicture.asset(
            //       "assets/images/home_image3.svg",
            //         height: screenwidth/3.5,
            //         width: screenwidth/80,),
            //     // height: screenwidth / 2.5,
            //     // width: screenwidth/5,
            // ),
          ],
        ),
        decoration: BoxDecoration(
          // color: primaryColor,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/home_image4.png"),
          ),
        ),
        height: screenwidth / 1.5,
        width: screenwidth,
      ),
      SizedBox(
        height: screenwidth / 42.8,
      ),
      Row(
        children: [
          SizedBox(
            width: screenwidth / 30,
          ),
          Text(
            "Featured Tracks",
            //textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: screenwidth / 26.75,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(
        height: screenwidth / 36.67,
      ),
    ],
  );
}

Widget _buildPlaylistAndSongs(double screenwidth) {
  return Column(
    children: [
      Container(
        height: screenwidth / 3.50,
        width: screenwidth,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: playlists.length,
          itemBuilder: (context, index) => _buildPlaylistItem(
            image: playlists[index].image,
            title: playlists[index].playlistName,
            id: playlists[index].id,
            screenwidth: screenwidth,
           
          ),
        ),
      ),
      SizedBox(
        height: screenwidth / 18.60,
      ),
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: screenwidth / 30),
        child: Text(
          "Top Tracks",
          style: TextStyle(
            fontSize: screenwidth / 26.75,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: screenwidth / 1.90,
        width: screenwidth / 1.05,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: songs.length,
          itemBuilder: (context, index) => _buildSonglistItem(
            image: songs[index].image,
            songPath: songs[index].songPath,
            title: songs[index].songName,
            subtitle: songs[index].artist,            
            time: songs[index].time, 
            id: songs[index].id,
            screenwidth: screenwidth,
            context: context,
          ),
        ),
      )
    ],
  );
}

Widget _buildPlaylistItem(
    {required String title,
    required String image,
    required double screenwidth,
    required int id}) {
  return Container(
    margin: EdgeInsets.only(
      left: id == 1 ? screenwidth / 30.7 : 0,
      right: screenwidth / 30.7,
    ),
    //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    width: screenwidth / 2.90,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenwidth / 21.4),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSonglistItem(
    {required String image,
    required String title,
    required String subtitle,
    required double screenwidth,
    required String time,
    required BuildContext context, 
    required int id, 
    required String songPath}) {
      //String img = image;
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: 
          (context) => PlayerScreen(
            id: id, 
            songImage: image, 
            artistName: subtitle, 
            songName: title,
            songPath: songPath,
            )));
    },
    child: ListTile(
      leading: Container(
        height: screenwidth / 8.30,
        width: screenwidth / 7.20,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(screenwidth / 142.67)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenwidth / 30.57,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: screenwidth / 35.667,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        time,
        style: TextStyle(
          fontSize: screenwidth / 35.667,
        ),
      ),
    ),
  );
}
