import 'package:flinder/models/current_track_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12.0,
                  ),
            )
          ],
        ),
        const SizedBox(
          width: 2.0,
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(Icons.shuffle),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 34.0,
              onPressed: () {},
              icon: Icon(Icons.play_circle_fill_outlined),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
            ),
            IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(Icons.repeat),
            ),
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text('0.00', style: Theme.of(context).textTheme.caption),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text(
              selected?.duration ?? '0.00',
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.devices_outlined),
          iconSize: 20.0,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.fullscreen_outlined),
          //iconSize: 20.0,
        ),
      ],
    );
  }
}
