import 'package:flinder/data/data.dart';
import 'package:flutter/material.dart';

import '../widgets/playlist_header.dart';
import '../widgets/tracks_list.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;
  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 160.0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      size: 28.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30.0,
              color: Colors.white,
            ),
            label: Text(
              "Somesh S",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
              onPressed: () {},
              padding: EdgeInsets.only(),
              icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 30.0)),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffaf1018),
            Theme.of(context).backgroundColor,
          ],
          stops: const [0, 0.3],
        )),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TrackList(tracks: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}
