import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers_with_rate/audioplayers.dart';
import 'package:first_app/constants/constants.dart';
import 'package:first_app/screens/audio_file/audio_file.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  int songId;
  String songImage;
  String songName;
  String songArtist;
  String songPath;
  PlayerScreen({
    Key? key, 
    required this.songId, 
    required this.songImage,
    required this.songName,
    required this.songArtist, 
    required this.songPath}) 
    : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {

  //we will need some variables
  bool isLoop = false;
  bool isRepeat = false;
  bool playing = false; // at the begining we are not playing any song
  IconData playbtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some objects
  //late AudioPlayer advancedPlayer;
  late AudioPlayer _player;
  AudioPlayer audioPlayer = new AudioPlayer();
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  // we will crate a custom slider
  Widget slider() {
    return Container(
      width: MediaQuery.of(context).size.width/1.30,
      child: Slider.adaptive(
        activeColor: primaryColor,
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(), 
        onChanged: (value){
          seekToSec(value.toInt());
        }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    //Now let's handle the audioplayer time
    _player.onDurationChanged.listen((Duration d) {
      setState(() {
        musicLength = d;
      });
    });

    _player.onAudioPositionChanged.listen((Duration p) { 
      setState(() {
        position = p;
      });
    });

    _player.onPlayerCompletion.listen((event) {
      setState(() {
        position = Duration(seconds: 0);
        playbtn = Icons.play_arrow;
        playing = false;
      });
    });

    cache.load(widget.songPath);
    //advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/player_image.jpg"),
                fit: BoxFit.cover,
              )
            ),
            height: screenwidth/1.40,
            width: screenwidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: screenwidth/2.10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenwidth/10),
              color: Colors.white,
            ),
            height: screenwidth/0.70,
            width: screenwidth,
            child: Column(
              children: [
                SizedBox(
                  height: screenwidth/7,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.songImage),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(screenwidth/10),
                    border: Border.all(color: Colors.black),                 
                  ),
                  height: screenwidth/2.413,
                  width: screenwidth/2.413,
                ),
                SizedBox(
                  height: screenwidth/22,
                ),
                Text(widget.songName,
                style: TextStyle(
                  fontSize: screenwidth/16.625,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                SizedBox(
                  height: screenwidth/60,
                ),
                Text(widget.songArtist,
                style: TextStyle(
                  fontSize: screenwidth/22.83,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                ),),
                SizedBox(
                  height: screenwidth/10,
                ),

                //AudioFile(advancedPlayer : advancedPlayer),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //let's start by adding the controller
                    //let's add the time indicator text
                    Container(
                      width: screenwidth/0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                            style: TextStyle(
                              fontSize: screenwidth/22.57,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          slider(),
                          Text(
                            "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                            style: TextStyle(
                              fontSize: screenwidth/22.57,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if(isRepeat == false) {
                              _player.setReleaseMode(ReleaseMode.LOOP);
                               setState(() {
                                  isRepeat = true;
                               });
                            } else {
                              if(isRepeat == true) {
                                _player.setReleaseMode(ReleaseMode.RELEASE);     
                                setState(() {
                                  isRepeat = false;
                               });             
                              }
                            }
                          },
                          icon: Icon(
                            Icons.loop,
                            color: isRepeat ? primaryColor : Colors.black,
                           ),
                        ),
                        SizedBox(
                          width: screenwidth/15,
                        ),
                        IconButton(
                          onPressed: () {
                            _player.setPlaybackRate(0.5);
                          },
                          icon: Icon(
                            Icons.skip_previous,
                           ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(right: screenwidth/29),
                          onPressed: () {
                            //here we will add the functinality of play button
                            if(playing == false) {
                              //now let's play the song
                              cache.play(widget.songPath);
                              setState(() {
                                playbtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              _player.pause();
                              setState(() {
                                playbtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          },
                          icon: Icon(
                            playbtn,
                            color: playing ? primaryColor : Colors.black,
                            size: screenwidth/8,
                           ),
                        ),
                        IconButton(
                          onPressed: () {
                            _player.setPlaybackRate(1.5);
                          },
                          icon: Icon(
                            Icons.skip_next,
                           ),
                        ),
                        SizedBox(
                          width: screenwidth/15,
                        ),
                        IconButton(
                          onPressed: () { },
                          icon: Icon(
                            Icons.repeat,
                           ),
                        ),
                      ],
                    ),
                  ],
                ),
               ],
             ),
          ),
        ),
      ]),
    );
  }
}