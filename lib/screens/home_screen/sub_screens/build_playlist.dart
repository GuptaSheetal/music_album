import 'package:first_app/screens/player_screen/player_screen.dart';
import 'package:first_app/services/playlist_services.dart';
import 'package:first_app/services/song_services.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BuildPlaylist extends StatefulWidget {
  const BuildPlaylist({Key? key}) : super(key: key);

  @override
  State<BuildPlaylist> createState() => _BuildPlaylistState();
}

class _BuildPlaylistState extends State<BuildPlaylist> {
  PlaylistServices playlistServices = PlaylistServices();
  SongServices songServices = SongServices();

  var songDataStream;
  var playlistDataStream;

  // QuerySnapshot <Map<String, dynamic>>? searchSnapShot;

  Future<void> getPlaylistData() async {
    await playlistServices.getPlaylistData().then((value) {
      setState(() {
        playlistDataStream = value;
        //print("Hello");
      });
    });

    Map firstPlaylistData = await playlistServices.getFirstPlaylist();
    if (firstPlaylistData.keys.isNotEmpty) {
      String pName = firstPlaylistData["playlistName"];
      String pId = firstPlaylistData["playlistId"];
      await getSongData(pId, pName);
    }
  }

  Future<void> getSongData(String pId, String pName) async {
    await songServices.getSongData(pId, pName).then((value) {
      setState(() {
        songDataStream = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPlaylistData();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenwidth / 42.8,
          ),
          Container(
            margin: EdgeInsets.only(left: screenwidth / 30.7),
            child: Text(
              "Featured Tracks",
              //textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: screenwidth / 26.75,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: screenwidth / 36.67,
          ),
          StreamBuilder(
              stream: songDataStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> songSnapshot) {
                return StreamBuilder(
                    stream: playlistDataStream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : snapshot.data == null
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : snapshot.data!.docs.isEmpty
                                  ? const Center(
                                      child: Text("No data present"),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (_, index) =>
                                                _buildPlaylistItem(
                                                    playlistImage: (snapshot
                                                            .data!.docs
                                                            .toList()[index]
                                                            .data()
                                                        as Map)["playlistImage"],
                                                    playlistName: (snapshot
                                                            .data!.docs
                                                            .toList()[index]
                                                            .data()
                                                        as Map)["playlistName"],
                                                    playlistId: (snapshot
                                                            .data!.docs
                                                            .toList()[index]
                                                            .data()
                                                        as Map)["playlistId"],
                                                    screenwidth: screenwidth,
                                                    index: index,
                                                    onPressed: () {
                                                      getSongData(
                                                          (snapshot.data!.docs
                                                                  .toList()[index]
                                                                  .data() as Map)[
                                                              "playlistId"],
                                                          (snapshot.data!.docs
                                                                  .toList()[index]
                                                                  .data() as Map)[
                                                              "collectionName"]);
                                                    }),
                                          ),
                                          height: screenwidth / 3.50,
                                          width: screenwidth,
                                        ),
                                        SizedBox(
                                          height: screenwidth / 42.8,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: screenwidth / 30.7),
                                          child: Text(
                                            "Top Tracks",
                                            //textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: screenwidth / 26.75,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        songSnapshot == null
                                            ? const Text("Song snapshot is null")
                                            : songSnapshot.data == null
                                                ? const Text(
                                                    "Song snapshot.data is null")
                                                : songSnapshot.data!.docs.isEmpty
                                                    ? const Text(
                                                        "No data present")
                                                    : Column(
                                                        children: [
                                                          SizedBox(
                                                            child: ListView.builder(
                                                                //shrinkWrap: true,
                                                                itemCount: songSnapshot.data!.docs.length,
                                                                itemBuilder: (_, index) => _buildSonglistItem(
                                                                    songImage: (songSnapshot.data!.docs.toList()[index].data() as Map)["songImage"],
                                                                    songName: (songSnapshot.data!.docs.toList()[index].data() as Map)["songName"],
                                                                    songArtist: (songSnapshot.data!.docs.toList()[index].data() as Map)["songArtist"],
                                                                    screenwidth: screenwidth,
                                                                    songTime: (songSnapshot.data!.docs.toList()[index].data() as Map)["songTime"],
                                                                    songId: (songSnapshot.data!.docs.toList()[index].data() as Map)["songId"],
                                                                    // songAudio: (songSnapshot
                                                                    //         .data!.docs
                                                                    //         .toList()[index]
                                                                    //         .data()
                                                                    //     as Map)["songAudio"],
                                                                    index: index,
                                                                    onPressed: () {
                                                                        // Navigator.of(
                                                                        //         context)
                                                                        //     .push(MaterialPageRoute(
                                                                        //         builder: (context) =>
                                                                        //              PlayerScreen(
                                                                        //                songId: (songSnapshot.data!.docs.toList()[index].data() as Map)["songId"], 
                                                                        //                songImage: (songSnapshot.data!.docs.toList()[index].data() as Map)["songImage"], 
                                                                        //                songName: (songSnapshot.data!.docs.toList()[index].data() as Map)["songName"], 
                                                                        //                songArtist: (songSnapshot.data!.docs.toList()[index].data() as Map)["songArtist"], 
                                                                        //                songPath: (songSnapshot.data!.docs.toList()[index].data() as Map)["songAudio"])));
                                                                    })),
                                                            height: screenwidth/2,
                                                            width: screenwidth,
                                                          ),
                                                        ],
                                                      )
                                      ],
                                    );
                    });
              }),
        ],
    );
  }

  _buildPlaylistItem(
      {required String playlistName,
      required String playlistImage,
      required String playlistId,
      required double screenwidth,
      required int index,
      required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? screenwidth / 30.7 : 0,
          right: screenwidth / 30.7,
        ),
        width: screenwidth / 2.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenwidth / 21.4),
            image: DecorationImage(
                image: AssetImage(playlistImage), fit: BoxFit.fill)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  playlistName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSonglistItem(
      {required String songImage,
      required String songName,
      required String songArtist,
      required double screenwidth,
      required String songTime,
      required String songId,
      required VoidCallback onPressed,
      //required String songAudio,
      required int index}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: screenwidth / 30.7),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  right: screenwidth / 30.7, bottom: screenwidth / 30.7),
              height: screenwidth / 8.30,
              width: screenwidth / 7.20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(songImage), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(screenwidth / 142.67)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songName,
                  style: TextStyle(
                    fontSize: screenwidth / 30.57,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenwidth / 60,
                ),
                Text(
                  songArtist,
                  style: TextStyle(
                    fontSize: screenwidth / 35.667,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: EdgeInsets.only(right: screenwidth / 30),
              child: Text(
                songTime,
                style: TextStyle(
                  fontSize: screenwidth / 35.667,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
