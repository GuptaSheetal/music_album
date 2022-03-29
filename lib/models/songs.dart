class Songs {
  final String songName;
  final String artist;
  final String image;
  final String time;
  final String songPath;
  final int id;

  Songs(
     {required this.artist, 
     required this.songName, 
     required this.image,
     required this.songPath, 
     required this.time,
     required this.id});

    
}
List<Songs> songs = [
  Songs(
    songName : "Chaka Chak", 
    artist: "Shreya Ghoshal", 
    image: "assets/images/songs/chaka_chak.jpg", 
    songPath: "music/chaka_chak.mp3", 
    time: "3:30",
    id: 1
  ),
  Songs(
    songName : "Bulleya", 
    artist: "Pritam Chakraborty", 
    image: "assets/images/songs/bulleya.jpg",
    songPath: "music/bulleya.mp3",  
    time: "4:30",
    id: 2
  ),
  Songs(
    songName : "Kamli", 
    artist: "Sunidhi Chauhan", 
    image: "assets/images/songs/kamli.jpg",
    songPath: "music/kamli.mp3",  
    time: "4:00",
    id: 3
  ),
  Songs(
    songName : "Kusu Kusu", 
    artist: "Zahrah S Khan", 
    image: "assets/images/songs/kusu_kusu.jpg",
    songPath: "music/kusu_kusu.mp3", 
    time: "5:30",
    id: 4
  ),
  Songs(
    songName : "Lut Gaye", 
    artist: "Jubin Nautiyal", 
    image: "assets/images/songs/lut_gaye.jpg",
    songPath: "music/lut_gaye.mp3", 
    time: "5:00",
    id: 5
  ),
  Songs(
    songName : "Param Sundari", 
    artist: "Shreya Ghoshal", 
    image: "assets/images/songs/param_sundari.jpg",
    songPath: "music/param_sundari.mp3", 
    time: "3:30",
    id: 6
  ),
  Songs(
    songName : "Srivalli", 
    artist: "Javed Ali", 
    image: "assets/images/songs/srivalli.jpg",
    songPath: "music/srivalli.mp3", 
    time: "4:10",
    id: 7
  ),
];



