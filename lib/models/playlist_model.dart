import 'package:player/models/models.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({required this.title, required this.songs, required this.imageUrl});
  static List<Playlist> playlists = [
    Playlist(
        title: "Hip-hop ",
        songs: Song.songs,
        imageUrl: "https://picsum.photos/200/300"),
    Playlist(
        title: "Hip-hop ",
        songs: Song.songs,
        imageUrl: "https://picsum.photos/200/300"),
    Playlist(
        title: "Hip-hop ",
        songs: Song.songs,
        imageUrl: "https://picsum.photos/200/300"),
  ];
}
