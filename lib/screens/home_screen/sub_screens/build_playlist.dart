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
    if(firstPlaylistData.keys.length > 0) {
      String pName = firstPlaylistData["playlistName"];
      String pId = firstPlaylistData["playlistId"];
      await getSongData(pName, pId);
      // var data = await songServices.getAllSongs(pId, pName);
    }


  }

  Future<void> getSongData(String pName, String pId) async {
    await songServices.getSongData(pId,pName ).then((value) {
      setState(() {
        songDataStream = value;
      });
    });
    
  }

  // Future<void> getSong(String pName) async {
  //   await songServices.getSongsFromPlaylist(pName).then((value) {
  //     setState(() {
  //       songDataStream = value;
  //     });
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPlaylistData();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        StreamBuilder(
            stream: playlistDataStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return snapshot == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.data == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : snapshot.data!.docs.length == 0
                          ? Center(
                              child: Text("No data present"),
                            )
                          : Column(
                              children: [
                                Container(
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) =>
                                        _buildPlaylistItem(
                                      playlistImage: (snapshot.data!.docs
                                          .toList()[index]
                                          .data() as Map)["playlistImage"],
                                      playlistName: (snapshot.data!.docs
                                          .toList()[index]
                                          .data() as Map)["playlistName"],
                                      playlistId: (snapshot.data!.docs
                                          .toList()[index]
                                          .data() as Map)["playlistId"],
                                      screenwidth: screenwidth,
                                      index: index,
                                    ),
                                  ),
                                  
                                  height: screenwidth / 3.50,
                                  width: screenwidth,
                                ),
                                StreamBuilder(
                                                  stream: songDataStream,
                                                  builder: (context,
                                                      AsyncSnapshot<
                                                              QuerySnapshot>
                                                          songSnapshot) {
                                                    return songSnapshot == null
                                                        ? Text("Song snapshot is null")
                                                        : songSnapshot.data ==
                                                                null
                                                            ? Text("Song snapshot.data is null")
                                                            : songSnapshot
                                                                        .data!
                                                                        .docs
                                                                        .length ==
                                                                    0
                                                                ? Text("Song snapshot.data.length is 0")
                                                                : Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: screenwidth /
                                                                            18.60,
                                                                      ),
                                                                      Container(
                                                                        alignment:
                                                                            Alignment.centerLeft,
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                screenwidth / 30),
                                                                        child:
                                                                            Text(
                                                                          "Top Tracks",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                screenwidth / 26.75,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: ListView
                                                                            .builder(
                                                                          itemCount: songSnapshot
                                                                              .data!
                                                                              .docs
                                                                              .length,
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          itemBuilder: (_, index) =>
                                                                              _buildSonglistItem(
                                                                            songArtist:"Artist",
                                                                                // (songSnapshot.data!.docs.toList()[index].data() as Map)["songArtist"],
                                                                            songId:
                                                                                (songSnapshot.data!.docs.toList()[index].data() as Map)["songId"],
                                                                            songImage:
                                                                                (songSnapshot.data!.docs.toList()[index].data() as Map)["songImage"],
                                                                            songName:
                                                                                (songSnapshot.data!.docs.toList()[index].data() as Map)["songName"],
                                                                            songAudio: "Audio",
                                                                                // (songSnapshot.data!.docs.toList()[index].data() as Map)["songAudio"],
                                                                            songTime:
                                                                                "5:00",
                                                                            index:
                                                                                index,
                                                                            screenwidth:
                                                                                screenwidth,
                                                                            context:
                                                                                context,
                                                                          ),
                                                                        ),
                                                                        height: screenwidth /
                                                                            3.50,
                                                                        width:
                                                                            screenwidth,
                                                                      ),
                                                                    ],
                                                                  );
                                                  })
                              ],
                            );
            }),
      ],
    );
  }
}

_buildPlaylistItem(
    {required String playlistName,
    required String playlistImage,
    required String playlistId,
    required double screenwidth,
    required int index}) {
  return GestureDetector(
    onTap: () {},
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
                style: TextStyle(
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
    required BuildContext context,
    required int songId,
    required String songAudio,
    required int index}) {
  return GestureDetector(
    // onTap: () {
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder:
    //       (context) => PlayerScreen(
    //         id: id,
    //         songImage: image,
    //         artistName: subtitle,
    //         songName: title,
    //         songPath: songPath,
    //         )));
    // },
    child: ListTile(
      leading: Container(
        height: screenwidth / 8.30,
        width: screenwidth / 7.20,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(songImage), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(screenwidth / 142.67)),
      ),
      title: Text(
        songName,
        style: TextStyle(
          fontSize: screenwidth / 30.57,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        songArtist,
        style: TextStyle(
          fontSize: screenwidth / 35.667,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        songTime,
        style: TextStyle(
          fontSize: screenwidth / 35.667,
        ),
      ),
    ),
  );
}
