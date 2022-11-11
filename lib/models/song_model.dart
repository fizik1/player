
class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song({required this.title,required this.description,required this.url,required this.coverUrl});

  static List<Song> songs = [
    Song(title: "Glass", description: "Glass", url: "assets/music/1,_2,_3_feat_Jason_Derulo_De_La.flac", coverUrl: "assets/image/img.png"),
    Song(title: "Illusion", description: "Illusion", url: "assets/music/Bahor     Ziyoda bahor.mp3", coverUrl: "assets/image/img_1.png"),
    Song(title: "Pray", description: "Pray", url: "assets/music/Oksy Avdalyan -  Asa - Xosa  Ասա - Խոսա (NEW 2022).mp3", coverUrl: "assets/image/img_2.png"),

  ];

}