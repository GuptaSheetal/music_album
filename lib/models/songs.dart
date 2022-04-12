class Songs {
  final String songName;
  final String songArtist;
  final String songImage;
  final String songTime;
  final String songAudio;
  final int songId;

  Songs(
     {required this.songArtist, 
     required this.songName, 
     required this.songImage,
     required this.songAudio, 
     required this.songTime,
     required this.songId});
    
}
List<Songs> songs = [
  Songs(
    songName : "Chaka Chak", 
    songArtist: "Shreya Ghoshal", 
    songImage: "assets/images/songs/chaka_chak.jpg", 
    songAudio: "music/chaka_chak.mp3", 
    songTime: "3:30",
    songId: 1
  ),
  Songs(
    songName : "Bulleya", 
    songArtist: "Pritam Chakraborty", 
    songImage: "assets/images/songs/bulleya.jpg",
    songAudio: "music/bulleya.mp3",  
    songTime: "4:30",
    songId: 2
  ),
  Songs(
    songName : "Kamli", 
    songArtist: "Sunidhi Chauhan", 
    songImage: "assets/images/songs/kamli.jpg",
    songAudio: "music/kamli.mp3",  
    songTime: "4:00",
    songId: 3
  ),
  Songs(
    songName : "Kusu Kusu", 
    songArtist: "Zahrah S Khan", 
    songImage: "assets/images/songs/kusu_kusu.jpg",
    songAudio: "music/kusu_kusu.mp3", 
    songTime: "5:30",
    songId: 4
  ),
  Songs(
    songName : "Lut Gaye", 
    songArtist: "Jubin Nautiyal", 
    songImage: "assets/images/songs/lut_gaye.jpg",
    songAudio: "music/lut_gaye.mp3", 
    songTime: "5:00",
    songId: 5
  ),
  Songs(
    songName : "Param Sundari", 
    songArtist: "Shreya Ghoshal", 
    songImage: "assets/images/songs/param_sundari.jpg",
    songAudio: "music/param_sundari.mp3", 
    songTime: "3:30",
    songId: 6
  ),
  Songs(
    songName : "Srivalli", 
    songArtist: "Javed Ali", 
    songImage: "assets/images/songs/srivalli.jpg",
    songAudio: "music/srivalli.mp3", 
    songTime: "4:10",
    songId: 7
  ),
];



