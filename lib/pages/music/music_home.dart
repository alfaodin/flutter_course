import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/pages/music/songs.dart';
import 'package:hello_world/pages/music/songs_controls.dart';
import 'package:hello_world/theme/music_theme.dart';

class MusicHome extends StatelessWidget {
  const MusicHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
          color: const Color(0xFFDDDDDD),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: const Color(0xFFDDDDDD),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // SEEK BAR
          Expanded(
            child: Center(
              child: Container(
                width: 125,
                height: 125,
                child: RadiaSeekBar(
                  child: ClipOval(
                    clipper: CircleClipper(),
                    child: Image.network(
                      demoPlaylist.songs[0].albumArtUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // VISUALIZER
          Container(
            width: double.infinity,
            height: 125,
          ),
          //SONG INFO
          new SongsControls(),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class RadialSeekBar extends StatefulWidget {
  final double thumbSize;
  final double thumbColor;
  
  final Color trackColor;
  final double trackWidth;
  
  final Color progressColor;
  final double progressWidth;
  

  RadialSeekBar({
    this.trackWidth = 3.0,
    this.trackColor = Colors.grey,
  });

  _RadialSeekBarState createState() => _RadialSeekBarState();
}

class _RadialSeekBarState extends State<RadialSeekBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
