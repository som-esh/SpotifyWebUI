import 'package:flinder/data/data.dart';
import 'package:flutter/material.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Playlist",
                  style: Theme.of(context)
                      .textTheme
                      .overline
                      ?.copyWith(fontSize: 12.0),
                ),
                const SizedBox(height: 12.0),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  "Created by ${playlist.creator} * ${playlist.songs.length} songs, ${playlist.duration}",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 20.0),
        _PlaylistButton(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButton extends StatelessWidget {
  final String followers;
  const _PlaylistButton({required this.followers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 48.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Theme.of(context).accentColor,
              primary: Theme.of(context).iconTheme.color,
              textStyle: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(fontSize: 12.0, letterSpacing: 2.0)),
          onPressed: () {},
          child: const Text("PLAY"),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text(
          "FOLLOWERS \n$followers",
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
