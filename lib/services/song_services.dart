import 'package:first_app/models/songs.dart';
import 'package:flutter/material.dart';



class SongServices {

  Widget _buildPlaylistAndSongs(Size size) {
    return Column(
      children: [
        // Container(
        //   height: 0.35 * size.height,
        //   width: size.width * 0.8,
        //   // color: Colors.purple,
        //   child: ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemCount: playlists.length,
        //     itemBuilder: (context, index) => _buildPlaylistItem(
        //         image: playlists[index].image,
        //         title: playlists[index].playlistName),
        //   ),
        // ),
        // Container(
        //   height: 0.35 * size.height,
        //   width: size.width * 0.8,
        //   child: ListView.builder(
        //     itemCount: songs.length,
        //     itemBuilder: (context, index) => _buildSonglistItem(
        //       image: songs[index].image,
        //       title: songs[index].songName,
        //       subtitle: songs[index].artist,
        //     ),
        //   ),
        // )
      ],
    );
  }

}