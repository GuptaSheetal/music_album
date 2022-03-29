import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  AudioPlayer advancedPlayer;
  AudioFile({
    Key? key, 
    required this.advancedPlayer
  }) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  AudioCache _audioCache = new AudioCache();

  Duration _duration = new Duration();
  Duration _position = new Duration();

  //String path = "assets/music/srivalli.mp3";

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) { setState(() {
      _duration = d;
    });});
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
      _position = p;
    });});

    //this.widget.advancedPlayer.setUrl(path);
  }

  Widget btnStart() {
    return IconButton(
      icon: Icon(_icons[0]),
      onPressed: () {
        //_audioCache.play("assets/music/srivalli.mp3");
        this.widget.advancedPlayer.play("music/srivalli.mp3");
      },
    );
  }

  Widget loadAssets() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          btnStart(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(_position.toString(), style: TextStyle( fontSize: 16),),

                Text(_duration.toString(), style: TextStyle( fontSize: 16),)
              ],
            ),
          ),
          loadAssets(),
        ],
      ),
    );
  }
}