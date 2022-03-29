class Playlist {
  final String playlistName;
  final String image;
  final int id;

  Playlist(
     {required this.playlistName, 
     required this.image, 
     required this.id}); 
}

List<Playlist> playlists = [
  Playlist(
    playlistName : "Party Songs", 
    image: "assets/images/playlist/party.jpg", 
    id: 1
  ),
  Playlist(
    playlistName : "Romantic Songs", 
    image: "assets/images/playlist/romantic.jpg", 
    id: 2
  ),
  Playlist(
    playlistName : "Punjabi Songs", 
    image: "assets/images/playlist/punjabi.jpg", 
    id: 3
  ),
  Playlist(
    playlistName : "Sufi Songs", 
    image: "assets/images/playlist/sufi.jpg", 
    id: 4
  ),
  Playlist(
    playlistName : "Friendship Songs", 
    image: "assets/images/playlist/friendship.jpg", 
    id: 5
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



