import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/Notification_screen/notification_screen.dart';
import 'package:first_app/screens/Radio_screen/radio_screen.dart';
import 'package:first_app/screens/home_screen/sub_screens/build_playlist.dart';
import 'package:first_app/screens/home_screen/sub_screens/build_side_bar.dart';
import 'package:first_app/screens/player_screen/player_screen.dart';
import 'package:first_app/screens/tv_screen/tv_screen.dart';
import 'package:first_app/services/playlist_services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_app/models/playlist.dart';
import 'package:first_app/models/songs.dart';
import 'package:first_app/screens/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  PlaylistServices playlistServices = PlaylistServices();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return AdvancedDrawer(
      backdropColor: primaryColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      openRatio: 0.5,
      rtlOpening: false,
      disabledGestures: false,
      // openRatio: 0.5,
      childDecoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(16)),
       // border: Border.all(),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            // textColor: Colors.black,
            // iconColor: Colors.black,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, screenwidth / 5.74, 0, screenwidth / 7.94),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(screenwidth / 37.5),
                        bottomRight: Radius.circular(screenwidth / 37.5)),
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/side_bar.jpg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            BorderRadius.circular(screenwidth / 11.02),
                      ),
                      height: screenwidth / 11.02,
                      width: screenwidth / 11.02,
                    ),
                    title: Text("Shinchan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: screenwidth / 30.6)),
                    subtitle: Row(
                      children: [
                        Icon(
                          TablerIcons.crown,
                          color: Colors.black38,
                          size: screenwidth / 30.5,
                        ),
                        SizedBox(
                          width: screenwidth / 55,
                        ),
                        Text(
                          "Premium",
                          style: TextStyle(
                              fontSize: screenwidth / 32.5,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                  ),
                  height: screenwidth / 5.95,
                  width: screenwidth / 1.20,
                ),
                BuildSideBar(),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
           Column(
            children: [
              Container(
                child: _homeHeader(screenwidth, context, _scaffoldKey,
                    _advancedDrawerController, _handleMenuButtonPressed),
              ),
              BuildPlaylist(),
              // SizedBox(
              //   height: screenwidth / 18.60,
              // ),
            ],
          ),
          ],
        ),
      ),
    );
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
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "#TRENDING",
                      style: TextStyle(
                        color: Colors.black,
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
                        color: Colors.black,
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
                        color: Colors.black,
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
                                  color: Colors.white,
                                  fontSize: screenwidth / 42.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: screenwidth / 23.777,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
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
                            Icons.share,
                            color: Colors.white,
                            size: screenwidth / 23.777,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor,
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
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
              )
            ],
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/home_image.png"),
            ),
          ),
          height: screenwidth / 1.5,
          width: screenwidth,
        ),
        SizedBox(
          height: screenwidth / 42.8,
        ),
      ],
    );
  }

// Widget _buildPlaylistAndSongs(double screenwidth, Stream playlistDataStream, BuildContext context) {
//   //var playlistDataStream;
//   return  StreamBuilder(
//     stream: playlistDataStream,
//     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//       return snapshot == null
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : snapshot.data == null
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : ListView(
//                             children: List.generate(
//                               snapshot.data!.docs.length,
//                               (index) => _buildPlaylistItem(
//                                 screenwidth: screenwidth,
//                                 playlistName: (snapshot.data!.docs[index].data()
//                                     as Map)["playlistName"],
//                                 playlistImage: (snapshot.data!.docs[index].data()
//                                     as Map)["playlistImage"]
//                                 // taskTime: (snapshot.data!.docs[index].data()
//                                 //     as Map)["timeOfUpload"],
//                               )
//                               )
//                             );
//     },
//   );
// }

// Widget _buildPlaylistItem(
//     {required dynamic playlistName,
//     required dynamic playlistImage,
//    // required double screenwidth,
//    // required int playlistId,
//     dynamic screenwidth}) {
//   return Container(
//     margin: EdgeInsets.only(
//       left: screenwidth / 30.7 ,
//       right: screenwidth / 30.7,
//     ),
//     //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//     width: screenwidth / 2.90,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(screenwidth / 21.4),
//         image: DecorationImage(image: AssetImage(playlistImage), fit: BoxFit.fill)),
//     child: Align(
//       alignment: Alignment.bottomCenter,
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               playlistName,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 10),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   Widget _buildSonglistItem(
//       {required String songImage,
//       required String songName,
//       required String songArtist,
//       required double screenwidth,
//       required String songTime,
//       required String songId,
//       required String songPath,
//       required BuildContext context}) {
//     //String img = image;
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => PlayerScreen(
//                   songId: songId,
//                   songImage: songImage,
//                   songArtist: songArtist,
//                   songName: songName,
//                   songPath: songPath,
//                 )));
//       },
//       child: ListTile(
//         leading: Container(
//           height: screenwidth / 8.30,
//           width: screenwidth / 7.20,
//           decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(songImage), fit: BoxFit.fill),
//               borderRadius: BorderRadius.circular(screenwidth / 142.67)),
//         ),
//         title: Text(
//           songName,
//           style: TextStyle(
//             fontSize: screenwidth / 30.57,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Text(
//           songArtist,
//           style: TextStyle(
//             fontSize: screenwidth / 35.667,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         trailing: Text(
//           songTime,
//           style: TextStyle(
//             fontSize: screenwidth / 35.667,
//           ),
//         ),
//       ),
//     );
//   }
}
