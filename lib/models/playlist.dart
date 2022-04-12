class Playlist {
  final String playlistName;
  final String playlistImage;
  final int playlistId;

  Playlist(
     {required this.playlistName, 
     required this.playlistImage, 
     required this.playlistId}); 
}

List<Playlist> playlists = [
  Playlist(
    playlistName : "Party Songs", 
    playlistImage: "assets/images/playlist/party.jpg", 
    playlistId: 1
  ),
  Playlist(
    playlistName : "Romantic Songs", 
    playlistImage: "assets/images/playlist/romantic.jpg", 
    playlistId: 2
  ),
  Playlist(
    playlistName : "Punjabi Songs", 
    playlistImage: "assets/images/playlist/punjabi.jpg", 
    playlistId: 3
  ),
  Playlist(
    playlistName : "Sufi Songs", 
    playlistImage: "assets/images/playlist/sufi.jpg", 
    playlistId: 4
  ),
  Playlist(
    playlistName : "Friendship Songs", 
    playlistImage: "assets/images/playlist/friendship.jpg", 
    playlistId: 5
  ),
  // Playlist(
  //   playlistName : "Holi Songs", 
  //   image: "assets/images/songs/lut_gaye.jpg", 
  //   id: 6
  // ),
  // Playlist(
  //   playlistName : "Devotional Songs", 
  //   image: "assets/images/songs/lut_gaye.jpg", 
  //   id: 7
  // ),
  // Playlist(
  //   playlistName : "Peace Songs", 
  //   image: "assets/images/songs/bulleya.jpg", 
  //   id: 8
  // ),
  // Playlist(
  //   playlistName : "90's Songs", 
  //   image: "assets/images/songs/lut_gaye.jpg", 
  //   id: 9
  // ),
  // Playlist(
  //   playlistName : "Patriotic Songs", 
  //   image: "assets/images/songs/lut_gaye.jpg", 
  //   id: 10
  // ),
  
];



