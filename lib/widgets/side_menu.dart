import 'package:flinder/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 200.0,
      color: Colors.black87,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 32, 0, 12),
                child: Image.asset("assets/spotify_logo.png",
                height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            title: "Home",
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            title: "Search",
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: "Radio",
            onTap: () {},
          ),
          const SizedBox(height: 12.0,),
          const _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => _LibraryPlaylistState();
}

class _LibraryPlaylistState extends State<_LibraryPlaylist> {

  ScrollController? _scrollController;
  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose(){
    _scrollController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0
                ),
                  child: Text(
                    "Your Library",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                ).toList(),
              ],
            ),
            SizedBox(height: 24.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0
                ),
                  child: Text(
                    "Playlist",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) => ListTile(
                  dense: true,
                  title: Text(
                    e,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                ),
                ).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}


class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 28.0,
        color: Colors.white,
      ),
      title: Text(
        title,
        //style: Theme.of(context).textTheme.bodyText1,
        style: const TextStyle(
          color: Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

