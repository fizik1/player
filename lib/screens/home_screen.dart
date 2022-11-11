

import 'package:flutter/material.dart';
import 'package:player/models/models.dart';
import 'package:player/models/song_model.dart';
import 'package:player/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Playlist> playlist = Playlist.playlists;
    List<Song> songs = Song.songs;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(.8),
            Colors.deepPurple.shade200.withOpacity(.8)
          ]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              Padding(
                padding:EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SectionHeader(title: "Playlist",action: '', ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: playlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:BorderRadius.circular(15.0),
                                child: Image.network(
                                  playlist[index].imageUrl,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    playlist[index].title,
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(

                                    '${playlist[index].songs.length} songs',
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],

                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({
    Key? key,
    required this.songs,
  }) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: const SectionHeader(title:"Trending Music", action:"View More"),
          ),
          SizedBox(height: 20,),
          SizedBox(height: MediaQuery.of(context).size.height*0.27, child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: songs.length,
            itemBuilder: ((context, index) {
              return SongCard(song: songs[index]);
            }),
          ),)
        ],
      ),
    );
  }
}





class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome", style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 8,),
          Text("Enjoy your favourite music", style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              hintText: "Search",
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey.shade400),
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade400,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none
              )
            ),
          )
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.deepPurple.shade800,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favourite"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: "Play"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_outlined),
            label: "Profile"
        ),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1668090956076-b2c9d6193e6b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80"
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
